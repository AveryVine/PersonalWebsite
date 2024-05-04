//
//  BadgeLink.swift
//  
//
//  Created by Avery Vine on 4/5/24.
//

import Foundation
import Ignite

extension ThemedPage {
    func BadgeLink(_ text: String, path: String, systemImage: String? = nil, external: Bool = false, includeLeadingMargin: Bool = false, includeTrailingMargin: Bool = true) -> InlineElement {
        Link(target: path) {
            Badge(text, systemImage: systemImage)
                .role(.primary)
                .badgeStyle(.subtle)
        }
        .target(external ? .blank : .default)
        .margin(.leading, includeLeadingMargin ? .small : .none)
        .margin(.trailing, includeTrailingMargin ? .small : .none)
    }
}
