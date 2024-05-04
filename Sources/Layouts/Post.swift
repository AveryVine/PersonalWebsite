//
// Post.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Post: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Group {
            Text(content.title)
                .font(.title1)
                .style(CustomFont(weight: .medium).style)

            Group {
                Text {
                    "Posted "
                    content.byline
                }
                .margin(.top, -5)

                Text(content.duration)
                    .margin(.top, -15)
            }
            .style(CustomFont(.workSans, size: .pixels(14)).style)

            if let image = content.image {
                Text {
                    Image(image, description: content.imageDescription)
                        .resizable()
                }
                .horizontalAlignment(.leading)
            }

            Text(content.body)

            Text {
                if content.hasTags {
                    for tag in content.tags {
                        BadgeLink(tag, path: "/tags/\(tag.convertedToSlug() ?? tag)", systemImage: "tag-fill")
                    }
                }
            }
            .font(.title5)
            .margin(.top, .large)
        }
    }
}
