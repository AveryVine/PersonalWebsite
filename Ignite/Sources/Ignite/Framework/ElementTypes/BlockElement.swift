//
// BlockElement.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation

/// Describes a HTML element that is rendered in block style, i.e. that it occupies the
/// full width of the page by default.
public protocol BlockElement: PageElement, HorizontalAligning {
    /// How many columns this should occupy when placed in a section.
    var columnWidth: ColumnWidth { get set }

    /// Whether this element should be displayed when placed in a section.
    var display: Display { get set }

    /// Adjusts the number of columns assigned to this element.
    /// - Parameter width: The new number of columns to use.
    /// - Returns: A copy of the current element with the adjusted column width.
    func width(_ width: Int) -> Self

    /// Adjusts the visibility of this element.
    /// - Parameter widths: Whether the element should be displayed for the given widths.
    /// - Returns: A copy of the current element with the adjusted visibility.
    func display(_ widths: Display.Width...) -> Self
}

extension BlockElement {
    /// Adjusts the number of columns assigned to this element.
    /// - Parameter width: The new number of columns to use.
    /// - Returns: A copy of the current element with the adjusted column width.
    public func width(_ width: Int) -> Self {
        var copy = self
        copy.columnWidth = .count(width)
        return copy
    }

    /// Adjusts the number of columns assigned to this element.
    /// - Parameter widths: The new numbers of columns to use.
    /// - Returns: A copy of the current element with the adjusted column widths.
    public func width(_ widths: ColumnWidth.Width...) -> Self {
        var copy = self
        copy.columnWidth = .counts(widths)
        return copy
    }

    /// Adjusts the number of columns assigned to this element.
    /// - Parameter widths: The new numbers of columns to use.
    /// - Returns: A copy of the current element with the adjusted column widths.
    public func width(_ widths: [ColumnWidth.Width]) -> Self {
        var copy = self
        copy.columnWidth = .counts(widths)
        return copy
    }
}

extension BlockElement {
    /// Adjusts the visibility of this element.
    /// - Parameter widths: Whether the element should be displayed for the given widths.
    /// - Returns: A copy of the current element with the adjusted visibility.
    public func display(_ widths: Display.Width...) -> Self {
        var copy = self
        copy.display = .display(widths)
        return copy
    }
}
