//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainNavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.svg", description: "")) {
            Link("Blog", target: "/all-posts")
                .padding(.trailing, .medium)
            Link("Work", target: "/work")
                .padding(.trailing, .medium)

            Dropdown("My Stuff") {
                Link("Droplet", target: "https://getdroplet.app")
                    .target(.blank)
                Link("Cyclo", target: "/cyclo")
                Link("All Projects", target: "/projects")
            }
            .padding(.trailing, .medium)

            Dropdown("Find Me Online") {
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
        .backgroundColor(Color(hex: "#343a40"))
        .position(.fixedTop)
    }
}
