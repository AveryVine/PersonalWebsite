//
//  Linked.swift
//
//
//  Created by Avery Vine on 23/3/24.
//

import Foundation
import Ignite

struct Linked: ContentPage {

    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Group {
            if let link = content.link {
                Link(target: link) {
                    content.titleElement()
                }
                .target(.blank)
            } else {
                content.titleElement()
            }
        }

        Group {
            Text(content.longByline(siteAuthorIfNecessary: context.site.author))
                .margin(.top, -5)
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

        Group {
            if let link = content.link {
                Link(target: link) {
                    "View Linked Content"
                    Image(systemName: "arrow-up-right-square")
                        .margin(.leading, 10)
                }
                .linkStyle(.button)
                .target(.blank)
                .margin(.vertical, .small)
            }
        }

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
