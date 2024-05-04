//
//  StaticPage+BlogPostList.swift
//
//
//  Created by Avery Vine on 25/3/24.
//

import Foundation
import Ignite

extension ThemedPage {
    func BlogPostList(allContent: [Content], includeAllPostsButton: Bool) -> BlockElement {
        Section {
            for content in allContent {
                let hasImage = content.image != nil

                Group {
                    Text {
                        Link(content.title, target: content.path)
                    }
                    .font(.title5)
                    .style(CustomFont(weight: .medium).style)
                    .class("recent-post-title")

                    Text(content.shortByline)
                        .style(CustomFont(.workSans, size: .pixels(14)).style)
                        .foregroundStyle(.secondary)
                        .margin(.top, -8)

                    Text {
                        content.shortDescription
                        Link(" Read&nbspmore…", target: content.path)
                    }
                    .margin(.top, -8)
                }
                .width(hasImage ? [.medium(7), .large(8)] : [.large(12)])

                if let image = content.image, hasImage {
                    Group {
                        Image(image)
                            .resizable()
                            .cornerRadius("5px")
                            .margin(.top, .extraSmall)
                    }
                    .width(.medium(5), .large(4))
                    .display(.medium(.block), .default(.none))
                    .margin(.bottom)
                }
            }

            if includeAllPostsButton {
                Group {
                    Link("View All Posts", target: "/all-posts")
                        .linkStyle(.button)
                }
                .horizontalAlignment(.center)
            }
        }
        .class("gy-4 gx-5")
    }
}
