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
    var theme = MainTheme(includeAuthorAttribution: false)

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Section {
                Group {
                    Image("images/AveryVine.jpeg", description: "Me, wearing a puffy winter jacket and a scarf")
                        .resizable()
                        .cornerRadius("2%")
                        .backgroundColor(.white)
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
                    Text("Software engineer at Apple, avid pianist, and proud cat owner.")
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
            Text("About Me")
                .font(.title3)
            Text("I’m a Localization Software Engineer at Apple, helping to make the software you use every day work seamlessly in over 40 languages. When I’m not programming, I love playing piano and video games—they often compete for my attention! General tech enthusiast, enjoyer of cats, and extremely infrequent blogger.")
            Text {
                BadgeLink("Apple", path: "/work#apple-localization-software-engineer", systemImage: "person-badge-fill")
                BadgeLink("Droplet", path: "/projects#droplet-plant-care-i-o-s-app", systemImage: "phone-fill")
                BadgeLink("averyvine", path: "https://mastodon.social/@averyvine", systemImage: "mastodon", external: true)
            }
        }
        .margin(.top, .extraLarge)

        Group {
            Divider()
                .class("underlined")
        }
        .margin(.top, .medium)

        BlogPostList(
            allContent: Array(context.allContent.sorted(by: \.date, order: .reverse).prefix(3)),
            includeAllPostsButton: true
        )
        .margin(.top, .large)
    }
}
