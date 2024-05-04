//
//  Content+Extra.swift
//
//
//  Created by Avery Vine on 23/3/24.
//

import Foundation
import Ignite

extension Content {
    var byline: String {
        "\(dateInCurrentTimeZone.formatted(date: .long, time: .shortened)) by \(author ?? "Avery Vine")"
    }

    var shortByline: String {
        "\(layoutType.bylineAction) \(dateInCurrentTimeZone.formatted(.relative(presentation: .named)))"
    }

    var duration: String {
        let estimatedReadingSeconds = estimatedReadingMinutes * 60
        let formattedDuration = Duration.seconds(estimatedReadingSeconds).formatted(.units(allowed: [.minutes]))
        return "Estimated: \(formattedDuration)"
    }

    var dateInCurrentTimeZone: Date {
        guard !hasAutomaticDate else { return date }
        let seconds = TimeZone.current.secondsFromGMT(for: date)
        return date.addingTimeInterval(TimeInterval(-seconds))
    }

    var link: String? {
        guard let subtitle else { return nil }
        return URL(string: subtitle)?.absoluteString
    }

    var shortDescription: String {
        let parser = MarkdownToHTML(markdown: body)
        let contentToStrip = if let moreIndex = parser.body.range(of: "<!--more-->")?.lowerBound {
            String(parser.body[..<moreIndex])
        } else if let paragraphIndex = parser.body.range(of: "</p>")?.lowerBound {
            String(parser.body[..<paragraphIndex])
        } else {
            parser.body
        }
        let result = contentToStrip.strippingTagsExceptParagraphs()
        return String(result.trimmingPrefix("<p>")) // Strip out the first paragraph marker, to prevent extra space above description
    }

    var layoutType: Layout {
        switch layout {
        case "Linked":  .linked
        default:        .post
        }
    }

    func titleElement(withFont font: Font = .title1) -> InlineElement {
        switch layoutType {
        case .post:
            Text(title)
                .font(font)
                .style(CustomFont(weight: .medium).style)
        case .linked:
            Text {
                Image(systemName: "link")
                    .margin(.trailing, 10)
                title
            }
            .font(font)
            .style(CustomFont(weight: .medium).style)
        }
    }
}

extension String {
    /// Removes all HTML tags from a string except for opening and closing paragraphs, so it's safe to use as plain-text.
    func strippingTagsExceptParagraphs() -> String {
        self.replacing(#/<(?!\/?(p|em|strong|s)\s?)[^>]+>/#, with: "")
    }
}
