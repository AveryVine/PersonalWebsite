//
// MainNavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainNavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.svg", description: "")) {
            Link("Work", target: "/work")
                .padding(.trailing, .medium)
            Link("Apps", target: "/apps")
                .padding(.trailing, .medium)
            Link("Blog", target: "/all-posts")
                .padding(.trailing, .medium)

            Dropdown("Connect", isAtNavEnd: true) {
                Link(target: "https://mastodon.social/@averyvine") {
                    Image(systemName: "mastodon")
                    " Mastodon"
                }
                .relationship(.me)
                .target(.blank)
                Link(target: "https://github.com/AveryVine") {
                    Image(systemName: "github")
                    " Github"
                }
                .target(.blank)
                Link(target: "https://linkedin.com/in/averyvine") {
                    Image(systemName: "linkedin")
                    " LinkedIn"
                }
                .target(.blank)
                Link(target: "mailto:averyvine@icloud.com") {
                    Image(systemName: "envelope-fill")
                    " E-mail"
                }
                .target(.blank)
            }
        }
        .navigationBarStyle(.dark)
        .navigationItemAlignment(.trailing)
        .backgroundColor(Color(hex: "#cc4a0e"))
        .position(.fixedTop)
    }
}
