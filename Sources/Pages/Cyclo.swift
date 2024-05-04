//
//  Cyclo.swift
//
//
//  Created by Avery Vine on 15/4/24.
//

import Foundation
import Ignite

struct Cyclo: StaticPage {
    var title = "Cyclo"

    var theme = AppPageTheme()

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Group {}
                .class("title-image")
                .id("cyclo-title-image")
        }
        .class("title-image-container")
        .id("cyclo-title-image-container")

        Section {
            Group {
                Text("Cyclo")
                    .font(.title1)
                    .class("underlined")
                Text("Dodge the blocks—with a twist!")
                    .font(.title3)
                    .margin(.bottom, .small)

                Text("Cyclo is an endless sidescrolling game, where your one and only goal is to dodge the incoming blocks. But there's a twist: you can't move your character up and down! Instead, you must harness the power of rotation to swerve between obstacles. There is a unique trait to the incoming blocks: they never come in pairs. This means, with careful timing, you can swap your direction of rotation and swerve right between them! But watch out! At various points throughout the game, it will become more difficult to survive. Watch out for things like your character moving up and down, blocks increasing speed, or even blocks switching to different heights at the last second!")

                Text {
                    "See it on the "
                    Link("App Store", target: "https://apple.co/39rNLE6")
                        .target(.blank)
                    "!"
                }
                .font(.title5)
            }
            .width(.large(7))

            Group {
                Image("/images/cyclo.gif", description: "A dot, surrounded by two other dots travelling in a circle around it, passes by vertical coloured blocks. The direction of rotation of the dots surrounding the inner dot changes constantly in order to avoid the blocks.")
                    .resizable()
                    .cornerRadius("5px")
                    .backgroundColor(.black)
                    .padding(5)
                    .margin(.bottom, .large)
                    .width(.large(5))
                    .class("mt-lg-5")
                Text("Tap the screen to dodge the incoming blocks, as they speed up and change heights!")
                    .foregroundStyle(.secondary)
                    .font(.body)
                    .horizontalAlignment(.center)
            }
            .margin(.bottom, .extraLarge)
        }
        .class("gx-5")
        .margin(.top, .extraLarge)

        Group {
            Text("Privacy Policy")
                .font(.title1)
                .class("underlined")
                .margin(.top, .extraLarge)
            Text{
                "Effective date: "
                PrivacyPolicy.cyclo.effectiveDate.formatted(date: .long, time: .omitted)
            }
            Text(MarkdownToHTML(markdown: PrivacyPolicy.cyclo.policyText).body)
        }
    }
}
