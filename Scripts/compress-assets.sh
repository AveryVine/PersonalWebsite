#!/bin/bash
#
# compress-assets.sh — produce web-sized images in Assets/ from the originals in OriginalAssets/.
#
# Full-resolution originals live in OriginalAssets/; Assets/ holds the compressed copies that
# Ignite publishes into public/. Always compressing from the pristine original keeps this script
# idempotent — re-running it never stacks generations of lossy re-encoding.
#
#   ./Scripts/compress-assets.sh                          # everything
#   ./Scripts/compress-assets.sh images/AveryVine.jpeg    # one file (path relative to OriginalAssets/)
#   ./Scripts/compress-assets.sh blog/a-new-chapter       # one directory
#   DRY_RUN=1 ./Scripts/compress-assets.sh                # report only, write nothing
#
# Requires: jpegoptim, pngquant, oxipng (brew install jpegoptim pngquant oxipng) and sips.
#
# After running, run the target to regenerate public/ — building alone won't do it.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_ROOT="$ROOT/OriginalAssets"
DST_ROOT="$ROOT/Assets"

# Retina-safe for a 1320px Bootstrap container. Images already smaller are left at their size.
MAX_DIM=2560
JPEG_QUALITY=82
DRY_RUN="${DRY_RUN:-0}"

# Per-image caps for images rendered into a known, much smaller slot. Without an entry here a
# small image would be published at up to MAX_DIM, which is wasted bytes on the pages that
# matter most. Keys are paths relative to OriginalAssets/.
override_max_dim() {
    case "$1" in
        # Home page portrait, rendered at .frame(maxWidth: 250) in Sources/Pages/Home.swift.
        images/AveryVine.jpeg) echo 886 ;;
        *)                     echo "$MAX_DIM" ;;
    esac
}

for tool in sips jpegoptim pngquant oxipng; do
    command -v "$tool" >/dev/null 2>&1 || { echo "error: $tool not found" >&2; exit 1; }
done
[ -d "$SRC_ROOT" ] || { echo "error: $SRC_ROOT not found" >&2; exit 1; }

# Restrict the walk to the paths given on the command line, defaulting to the whole tree.
search_paths=()
if [ "$#" -gt 0 ]; then
    for arg in "$@"; do
        candidate="$SRC_ROOT/${arg#OriginalAssets/}"
        [ -e "$candidate" ] || { echo "error: no such path in OriginalAssets/: $arg" >&2; exit 1; }
        search_paths+=("$candidate")
    done
else
    search_paths=("$SRC_ROOT")
fi

total_before=0
total_after=0
count=0

printf '%-62s %10s %10s %8s\n' "FILE" "ORIGINAL" "PUBLISHED" "SAVED"

while IFS= read -r -d '' src; do
    rel="${src#"$SRC_ROOT"/}"
    dst="$DST_ROOT/$rel"
    ext="${src##*.}"

    before=$(stat -f%z "$src")

    # GIF and SVG have no lossy step here (animated GIFs would need gifsicle), so pass them
    # through untouched rather than silently dropping them from Assets/.
    case "$ext" in
        jpg|jpeg|JPG|JPEG|png|PNG) ;;
        *)
            if [ "$DRY_RUN" = 0 ]; then
                mkdir -p "$(dirname "$dst")"
                cp -p "$src" "$dst"
            fi
            printf '%-62s %9sK %9sK %7s\n' "$rel" "$((before/1024))" "$((before/1024))" "copied"
            total_before=$((total_before + before))
            total_after=$((total_after + before))
            count=$((count + 1))
            continue
            ;;
    esac

    if [ "$DRY_RUN" != 0 ]; then
        printf '%-62s %9sK %9s %8s\n' "$rel" "$((before/1024))" "-" "dry-run"
        continue
    fi

    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"

    cap=$(override_max_dim "$rel")
    width=$(sips -g pixelWidth  "$dst" 2>/dev/null | awk '/pixelWidth/{print $2}')
    height=$(sips -g pixelHeight "$dst" 2>/dev/null | awk '/pixelHeight/{print $2}')
    if [ -z "${width:-}" ] || [ -z "${height:-}" ]; then
        echo "warning: could not read dimensions, copied verbatim: $rel" >&2
        continue
    fi

    longest=$width
    [ "$height" -gt "$width" ] && longest=$height
    if [ "$longest" -gt "$cap" ]; then
        sips --resampleHeightWidthMax "$cap" -s formatOptions best "$dst" >/dev/null 2>&1
    fi

    case "$ext" in
        jpg|jpeg|JPG|JPEG)
            jpegoptim --strip-all --max="$JPEG_QUALITY" --quiet "$dst"
            ;;
        png|PNG)
            # --skip-if-larger leaves the file alone when quantizing wouldn't actually help.
            pngquant --quality=65-90 --speed 1 --strip --skip-if-larger \
                     --force --output "$dst" -- "$dst" 2>/dev/null
            oxipng -o 4 --strip safe --quiet "$dst" 2>/dev/null
            ;;
    esac

    after=$(stat -f%z "$dst")
    total_before=$((total_before + before))
    total_after=$((total_after + after))
    count=$((count + 1))

    saved=0
    [ "$before" -gt 0 ] && saved=$(( (before - after) * 100 / before ))
    printf '%-62s %9sK %9sK %7s%%\n' "$rel" "$((before/1024))" "$((after/1024))" "$saved"
done < <(find "${search_paths[@]}" -type f ! -name '.DS_Store' -print0 | sort -z)

echo
if [ "$DRY_RUN" != 0 ]; then
    echo "Dry run — nothing written."
    exit 0
fi
echo "$count file(s): $((total_before/1024/1024)) MB -> $((total_after/1024/1024)) MB"
[ "$total_before" -gt 0 ] && echo "Saved $(( (total_before - total_after) * 100 / total_before ))%"
echo "Run the target to regenerate public/."
