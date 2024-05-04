//
//  Display.swift
//
//
//  Created by Avery Vine on 14/4/24.
//

import Foundation

/// Controls whether an element is displayed in a `Section`.
public enum Display {
    public enum Width {
        case `default`(Visibility)
        case extraSmall(Visibility)
        case small(Visibility)
        case medium(Visibility)
        case large(Visibility)
        case extraLarge(Visibility)
    }

    public enum Visibility: String {
        case none
        case block
    }

    /// The system will automatically hide or show the element.
    case automatic

    /// This element should be hidden or shown depending on the width.
    case display([Width])

    /// Returns the Bootstrap class name for the column width.
    var className: String {
        switch self {
        case .automatic:
            Visibility.block.rawValue
        case .display(let widths):
            widths.map { width in
                switch width {
                case .default(let visibility):
                    "d-\(visibility.rawValue)"
                case .extraSmall(let visibility):
                    "d-xs-\(visibility.rawValue)"
                case .small(let visibility):
                    "d-sm-\(visibility.rawValue)"
                case .medium(let visibility):
                    "d-md-\(visibility.rawValue)"
                case .large(let visibility):
                    "d-lg-\(visibility.rawValue)"
                case .extraLarge(let visibility):
                    "d-xl-\(visibility.rawValue)"
                }
            }.joined(separator: " ")
        }
    }
}
