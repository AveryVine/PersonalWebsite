//
// MainTheme.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)
            Body {
                Group {
                    Include("Styles.html")
                    MainNavBar()
                    page.body
                        .margin(.bottom, .extraLarge)
                    IgniteFooter()
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
