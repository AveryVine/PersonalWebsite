//
// TagPage.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Tags: TagPage {
    var theme = MainTheme(includeAuthorAttribution: false)

    func body(tag: String?, context: PublishingContext) -> [any BlockElement] {
        if let tag {
            Text {
                Image(systemName: "tag-fill")
                    .margin(.trailing, 10)
                tag
            }
            .font(.title1)
            .class("underlined")
            .margin(.bottom, .large)

            Text {
                Link(target: "/tags") {
                    Image(systemName: "tags-fill")
                        .margin(.trailing, 5)
                    "All Tags"
                }
            }
            .horizontalAlignment(.trailing)
            .margin(.top, -60)
            .margin(.bottom, .extraLarge)

            BlogPostList(
                allContent: Array(context.content(tagged: tag).sorted(by: \.date, order: .reverse)),
                includeAllPostsButton: false
            )
            .margin(.top, .large)
        } else {
            Text {
                Image(systemName: "tags-fill")
                    .margin(.trailing, 10)
                "All Tags"
            }
            .font(.title1)
            .class("underlined")
            .margin(.bottom, .large)

            let tags = context.allContent.reduce(into: Set<String>()) { allTags, content in
                allTags.formUnion(content.tags)
            }.sorted { $0 < $1 }

            Section {
                for tag in tags {
                    Text {
                        BadgeLink(tag, path: "/tags/\(tag.convertedToSlug() ?? tag)", systemImage: "tag-fill")
                    }
                    .font(.title5)
                    .width(.medium(4), .large(3), .default(6))
                    .margin(.small)
                }
            }
        }
    }
}
