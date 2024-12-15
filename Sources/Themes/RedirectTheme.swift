//
// RedirectTheme.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct RedirectTheme: Theme {
    let redirectPath: String

    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context, redirectTo: redirectPath)
            Body {
                Group {
                    Include("Styles.html")
                    RedirectNavBar()
                    page.body
                        .margin(.bottom, .extraLarge)
                }
                .frame(maxWidth: 900)
                .style("margin: auto")
            }
            .margin(.top, .extraLarge)
            .padding(.top, .extraLarge)
            .padding(.horizontal, .large)
        }
    }
}
