//
//  AppPageTheme.swift
//
//
//  Created by Avery Vine on 15/4/24.
//

import Foundation
import Ignite

struct AppPageTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)
            Body {
                Group {
                    Include("Styles.html")
                    AppPageNavBar()
                    page.body
                }
                .frame(maxWidth: 900)
                .style("margin: auto")
            }
            .margin(.vertical, .extraLarge)
            .padding(.top, .extraLarge)
            .padding(.horizontal, .large)
        }
    }
}
