//
//  Work.swift
//
//
//  Created by Avery Vine on 25/3/24.
//

import Foundation
import Ignite

struct Work: StaticPage {
    var title = "Work"
    var theme = MainTheme(includeAuthorAttribution: false)

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Work")
            .font(.title1)
            .class("underlined")
            .margin(.bottom, .extraLarge)

        Section {
            for (index, job) in Job.allJobs.enumerated() {
                Group {}
                    .margin(.top, -80)
                    .id(job.id)
                    .width(12)
                Group {
                    Text(job.company)
                        .font(.title2)
                        .style(CustomFont(weight: .medium).style)
                    Text(job.title)
                        .font(.title4)
                    Text(job.employmentPeriod)
                        .font(.title5)
                        .foregroundStyle(.tertiary)
                        .margin(.top, -5)
                        .margin(.bottom)

                    Text(MarkdownToHTML(markdown: job.description).body)
                }
                .width(job.image != nil ? .medium(7) : .default(12))

                if let image = job.image {
                    Image(image.path, description: image.description)
                        .resizable()
                        .cornerRadius("5px")
                        .margin(.top, .extraSmall)
                        .margin(.bottom)
                }

                if index < Job.allJobs.count - 1 {
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
