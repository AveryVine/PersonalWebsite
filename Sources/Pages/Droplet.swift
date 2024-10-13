//
//  Droplet.swift
//  PersonalWebsite
//
//  Created by Avery Vine on 13/10/24.
//

import Foundation
import Ignite

struct Droplet: StaticPage {
    var title = "Droplet"
    var theme = AppPageTheme()

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Group {}
                .class("title-image")
                .id("droplet-title-image")
        }
        .class("title-image-container")
        .id("droplet-title-image-container")

        Section {
            Group {
                Text("Droplet")
                    .font(.title1)
                    .class("underlined")
                Text("All Your Plants, At A Glance")
                    .font(.title3)
                    .margin(.bottom, .small)

                Text("Droplet offers a beautiful, elegant, and powerful plant-care experience, designed from the ground up to help you keep your plants alive.")
                Text("Watering and Fertilizing Schedules")
                    .font(.title5)
                Text("Set how often you need to care for each plant, and every time you open Droplet you will be greeted with a list of plants that are due for care today. Plus, if you take new pictures of your plants as you care for them, you’ll be able to curate your own history of their growth over time!")
                Text("Daily Reminders")
                    .font(.title5)
                Text("Want to set and forget? No problem! Droplet can send you notifications at the time of your choosing, so you never miss a watering day. Out of town, or maybe your plants don’t look like they need watering just yet? Simply snooze your plants and Droplet will let you know when it’s time to care for them again.")
                Text("Advanced Features")
                    .font(.title5)
                Text("Droplet comes with advanced features such as the ability to tag your plants and powerful search that leverages those tags, so the plant you’re looking for is just moments away, and Shortcuts support, so you can automate your care routine with ease.")

                Text {
                    "See it on the "
                    Link("App Store", target: "https://apple.co/3UvVf3x")
                        .target(.blank)
                    "!"
                }
                .font(.title5)
            }
            .width(.large(7))

            Group {
                Image("/images/droplet.png", description: "A screenshot of plants in the Droplet app. Four are shown as needing care today (three watering, one fertilizing). Several plants are shown below in the All Plants section, with the #basement tag applied to filter them.")
                    .resizable()
                    .cornerRadius("12px")
                    .backgroundColor(.forestGreen)
                    .padding(.top, 20)
                    .padding(.leading, 10)
                    .margin(.bottom, .large)
                    .width(.large(5))
                    .class("mt-lg-5")
                Text("Stay organized and keep your plants healthy!")
                    .foregroundStyle(.secondary)
                    .font(.body)
                    .horizontalAlignment(.center)
            }
            .margin(.bottom, .extraLarge)
        }
        .class("gx-5")
        .margin(.top, .extraLarge)

        Group {
            Accordion {
                Item("Privacy Policy") {
                    Text{
                        "Effective date: "
                        PrivacyPolicy.droplet.effectiveDate.formatted(date: .long, time: .omitted)
                    }
                    Text(MarkdownToHTML(markdown: PrivacyPolicy.droplet.policyText).body)
                }
            }
            .margin(.top, .extraLarge)
        }
        .id("privacy-policy")
    }
}
