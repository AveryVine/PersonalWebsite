//
//  Apps.swift
//  PersonalWebsite
//
//  Created by Avery Vine on 13/10/24.
//

import Foundation
import Ignite

struct Apps: StaticPage {
    var title = "Apps"
    var theme = MainTheme(includeAuthorAttribution: false)

    let apps = Project.allProjects.filter { $0.isApp }

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Apps")
            .font(.title1)
            .class("underlined")
            .margin(.bottom, .extraLarge)

        Section {
            for (index, project) in apps.enumerated() {
                Group {}
                    .margin(.top, -80)
                    .id(project.id)
                    .width(12)
                Group {
                    Text(project.title)
                        .font(.title2)
                        .style(CustomFont(weight: .medium).style)
                    Text(project.subtitle)
                        .font(.title4)

                    Text(MarkdownToHTML(markdown: project.description).body)

                    Text {
                        if let githubURL = project.links.githubURL {
                            BadgeLink("Github", path: githubURL, systemImage: "github", external: true)
                        }

                        if let appStoreURL = project.links.appStoreURL {
                            BadgeLink("App Store", path: appStoreURL, systemImage: "apple", external: true)
                        }

                        if let webURL = project.links.webURL {
                            BadgeLink("Web", path: webURL, systemImage: "browser-safari", external: !webURL.hasPrefix("/"))
                        }
                    }
                    .font(.title5)
                }
                .width(project.image != nil ? .medium(7) : .default(12))

                if let image = project.image {
                    Image(image.path, description: image.description)
                        .resizable()
                        .cornerRadius("5px")
                        .margin(.top, .extraSmall)
                        .margin(.bottom)
                }

                if index < apps.count - 1 {
                    Group {
                        Divider()
                    }
                    .margin(.bottom, 30)
                    .width(12)
                }
            }
        }
        .class("gx-5")
    }
}
