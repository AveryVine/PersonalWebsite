//
// ColumnWidth.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation

/// Controls how many columns a given block element takes up in a `Section`.
public enum ColumnWidth {
    public enum Width {
        case `default`(Int)
        case extraSmall(Int)
        case small(Int)
        case medium(Int)
        case large(Int)
        case extraLarge(Int)
    }

    /// The system will divide the available space automatically. For example,
    /// if there are three automatically sized elements in a 12-column section,
    /// each will be allocated four columns.
    case automatic

    /// This element should take up a precise number of columns.
    case count(Int)

    /// This element should take up a number of columns dependent on the width.
    case counts([Width])

    /// Returns the Bootstrap class name for the column width.
    var className: String {
        switch self {
        case .automatic:
            "col"
        case .count(let int):
            "col-\(int)"
        case .counts(let widths):
            widths.map { width in
                switch width {
                case .default(let int):
                    "col-\(int)"
                case .extraSmall(let int):
                    "col-xs-\(int)"
                case .small(let int):
                    "col-sm-\(int)"
                case .medium(let int):
                    "col-md-\(int)"
                case .large(let int):
                    "col-lg-\(int)"
                case .extraLarge(let int):
                    "col-xl-\(int)"
                }
            }.joined(separator: " ")
        }
    }
}
