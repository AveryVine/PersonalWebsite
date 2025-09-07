//
// MainTheme.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainTheme: Theme {
    let includeAuthorAttribution: Bool
    let includeIgniteCredit: Bool

    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context, includeAuthorAttribution: includeAuthorAttribution)
            Body {
                Group {
                    Include("Styles.html")
                    MainNavBar()
                    page.body
                        .margin(.bottom, .extraLarge)
                    if includeIgniteCredit {
                        IgniteFooter()
                    }
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
