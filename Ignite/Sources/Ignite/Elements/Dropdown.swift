//
// Dropdown.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation

/// Elements that conform to `DropdownElement` can be shown inside
/// Dropdown objects.
public protocol DropdownElement: InlineElement { }

/// Renders a button that presents a menu of information when pressed.
/// Can be used as a free-floating element on your page, or in
/// a `NavigationBar`.
public struct Dropdown: BlockElement, NavigationItem {
    /// The standard set of control attributes for HTML elements.
    public var attributes = CoreAttributes()

    /// How many columns this should occupy when placed in a section.
    public var columnWidth = ColumnWidth.automatic

    /// Whether this element should be displayed when placed in a section.
    public var display = Display.automatic

    /// The title for this `Dropdown`.
    var title: any InlineElement

    /// Whether this dropdown is at the end of a navigation bar.
    var isAtNavEnd: Bool

    /// The array of items to shown in this `Dropdown`.
    var items: [any DropdownElement]

    /// How large this dropdown should be drawn. Defaults to `.medium`.
    var size = ButtonSize.medium

    /// How this dropdown should be styled on the screen. Defaults to `.defaut`.
    var role = Role.default

    /// Controls whether this dropdown needs to be created as its own element,
    /// or whether it uses the structure provided by a parent `NavigationBar`.
    private var isNavigationItem = false

    /// Creates a new dropdown button using a title and an element that builder
    /// that returns an array of types conforming to `DropdownElement`.
    /// - Parameters:
    ///   - title: The title to show on this dropdown button.
    ///   - isAtNavEnd: Whether this dropdown is at the end of a navigation bar.
    ///   - items: The elements to place inside the dropdown menu.
    public init(
        _ title: any InlineElement,
        isAtNavEnd: Bool = false,
        @ElementBuilder<any DropdownElement> items: () -> [any DropdownElement]
    ) {
        self.title = title
        self.isAtNavEnd = isAtNavEnd
        self.items = items()
    }

    /// Adjusts the size of this dropdown.
    /// - Parameter size: The new size.
    /// - Returns: A new `Dropdown` instance with the updated size.
    public func dropdownSize(_ size: ButtonSize) -> Self {
        var copy = self
        copy.size = size
        return copy
    }

    /// Adjusts the role of this dropdown
    /// - Parameter style: The new role.
    /// - Returns: A new `Dropdown` instance with the updated role.
    public func role(_ role: Role) -> Dropdown {
        var copy = self
        copy.role = role
        return copy
    }

    /// Configures this dropdown to be placed inside a `NavigationBar`.
    /// This removes its <div> at render-time, which means it will use the
    /// structure provided directly by the `NavigationBar`.
    /// - Returns: A new `Dropdown` instance suitable for placement
    /// inside a `NavigationBar`.
    func configuredAsNavigationItem() -> Self {
        var copy = self
        copy.isNavigationItem = true
        return copy
    }

    private var classes: [String] {
        var classes = ["dropdown-menu"]
        if isAtNavEnd {
            classes.append("dropdown-menu-end")
        }
        return classes
    }

    /// Renders this element using publishing context passed in.
    /// - Parameter context: The current publishing context.
    /// - Returns: The HTML for this element.
    public func render(context: PublishingContext) -> String {
        Group(isTransparent: isNavigationItem) {
            if isNavigationItem {
                Link(title, target: "#")
                    .addCustomAttribute(name: "role", value: "button")
                    .class("dropdown-toggle", "nav-link")
                    .data("bs-toggle", "dropdown")
                    .aria("expanded", "false")
            } else {
                Button(title)
                    .class(Button.classes(forRole: role, size: size))
                    .class("dropdown-toggle")
                    .data("bs-toggle", "dropdown")
                    .aria("expanded", "false")
            }

            List {
                for item in items {
                    ListItem {
                        if item is Link {
                            item.class("dropdown-item")
                        } else {
                            item.class("dropdown-header")
                        }
                    }
                }
            }
            .listStyle(.unordered(.default))
            .class(classes)
        }
        .attributes(attributes)
        .class("dropdown")
        .render(context: context)
    }
}
