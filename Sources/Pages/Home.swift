//
// Home.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"
    var theme = MainTheme(includeAuthorAttribution: false, includeIgniteCredit: true)

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Section {
                Group {
                    Image("images/AveryVine.jpeg", description: "Me, wearing a puffy winter jacket and a scarf")
                        .resizable()
                        .cornerRadius("8%")
                        .backgroundColor(.whiteSmoke)
                        .frame(maxWidth: 250)
                        .style("width: 100%")
                        .margin(.top, .medium)
                        .padding(.small)
                }
                .width(5)

                Text("")
                    .width(.small(1))
                    .display(.small(.block), .default(.none))

                Group {
                    Text("Hi, I’m Avery!")
                        .font(.title1)
                    Text("Software Engineer at Apple, hobbiest pianist, cat enjoyer.")
                        .font(.lead)
                        .margin(.top, .small)
                    Text("Ottawa 🇨🇦 → San Francisco 🇺🇸")
                        .font(.lead)
                        .display(.medium(.block), .default(.none))
                }
                .foregroundStyle(.white)
                .style(CustomFont(.workSans).style)
                .padding(.top)
                .horizontalAlignment(.leading)
                .width(.small(6), .default(7))

                Group {
                    Text("Ottawa 🇨🇦 → San Francisco 🇺🇸")
                        .font(.lead)
                        .foregroundStyle(.white)
                        .style(CustomFont(.workSans).style)
                        .display(.medium(.none), .default(.block))
                }
                .class("mt-3 mt-md-5")
            }
            .rowClass("m-auto")

            Group {}
                .class("title-image")
                .id("home-title-image")
        }
        .class("title-image-container")
        .padding(.bottom, 10)
        .horizontalAlignment(.center)

        Group {

            Group {
                BadgeLink("Work: Apple", path: "/work#apple-localization-software-engineer", systemImage: "person-badge-fill")
                BadgeLink("App: Droplet", path: "/droplet", systemImage: "phone-fill")
                BadgeLink("Social: averyvine", path: "https://mastodon.social/@averyvine", systemImage: "mastodon", external: true)
            }
            .margin(.bottom, .medium)

            Text("About Me")
                .font(.title3)

            Text("I help make the software you use every day work beautifully for people all around the world.")

            Text("Some favourites I've worked on:")
                .margin(.bottom, .extraSmall)
            List {
                ListItem {
                    "Xcode feature to "
                    Link(
                        "translate apps using agents",
                        target: "https://developer.apple.com/videos/play/wwdc2026/213"
                    )
                    .target(.blank)
                }
                ListItem {
                    "Localization of apps & system UI for "
                    Link(
                        "iPhone Duo",
                        target: "https://www.apple.com/newsroom/2026/09/apple-unveils-iphone-duo/"
                    )

                }
                ListItem {
                    "Localization of apps & system UI for "
                    Link(
                        "the new design & Liquid Glass",
                        target: "https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/"
                    )
                    .target(.blank)
                }
            }
        }
        .margin(.top, .large)

        Group {
            Divider()
                .class("underlined")
        }

        Group {
            BlogPostList(
                allContent: Array(context.allContent.sorted(by: \.date, order: .reverse).prefix(3)),
                includeAllPostsButton: true
            )
        }
        .margin(.top, .extraLarge)
    }
}
