//
// Section.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation

/// Creates one distinct section on your page, where content inside is fitted to
/// a 12-column grid. If the items in your section have widths that add up to
/// 12 then they will fit in a single row, otherwise they will be placed on multiple
/// rows. This element automatically adapts to constrained horizontal dimensions
/// by placing your content across multiple rows automatically.
///
/// **Note**: A 12-column grid is the default, but you can adjust that downwards
/// by using the `columns()` modifier.
public struct Section: BlockElement {
    /// The standard set of control attributes for HTML elements.
    public var attributes = CoreAttributes()

    /// How many columns this should occupy when placed in a section.
    public var columnWidth = ColumnWidth.automatic

    /// Whether this element should be displayed when placed in a section.
    public var display = Display.automatic

    /// How many columns this should be divided into
    var columnCount: Int?

    /// The items to display in this section.
    var items: [any BlockElement]

    /// Any additional classes that should be applied to all rows in this section.
    var rowClasses = [String]()

    /// Creates a new `Section` object using a block element builder
    /// that returns an array of items to use in this section.
    /// - Parameter items: The items to use in this section.
    public init(@BlockElementBuilder items: () -> [any BlockElement]) {
        self.items = items()
    }

    /// Adjusts the number of columns that can be fitted into this section.
    /// - Parameter columns: The number of columns to use
    /// - Returns: A new `Section` instance with the updated column count.
    public func columns(_ columns: Int) -> Self {
        var copy = self
        copy.columnCount = columns
        return copy
    }

    /// Renders this element using publishing context passed in.
    /// - Parameter context: The current publishing context.
    /// - Returns: The HTML for this element.
    public func render(context: PublishingContext) -> String {
        var sectionAttributes = attributes.appending(classes: ["row"])

        if let columnCount {
            sectionAttributes.append(classes: ["row-cols-\(columnCount)"])
        }

        return Group {
            for item in items {
                Group {
                    item
                }
                .class(item.columnWidth.className)
                .class(item.display.className)
                .class(rowClasses)
            }
        }
        .attributes(sectionAttributes)
        .render(context: context)
    }
}

extension Section {
    public func rowClass(_ rowClass: String) -> Self {
        var copy = self
        copy.rowClasses.append(rowClass)
        return copy
    }
}
