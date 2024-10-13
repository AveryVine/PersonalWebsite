//
// AllPosts.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct AllPosts: StaticPage {
    var title = "Blog"
    var theme = MainTheme(includeAuthorAttribution: false)

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Blog—All Posts")
            .font(.title1)
            .class("underlined")
            .margin(.bottom, .large)

        Text {
            Image(systemName: "rss-fill")
                .foregroundStyle(Color(hex: "#f26522"))
                .margin(.trailing, 5)
            Link("Feed", target: "/feed.rss")
        }
        .horizontalAlignment(.trailing)
        .margin(.top, -60)
        .margin(.bottom, .extraLarge)

        BlogPostList(
            allContent: context.allContent.sorted(by: \.date, order: .reverse),
            includeAllPostsButton: false
        )
    }
}
