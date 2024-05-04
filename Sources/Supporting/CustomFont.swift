//
//  CustomFont.swift
//
//
//  Created by Avery Vine on 23/3/24.
//

import Foundation

struct CustomFont: StyleGroup {
    enum Family: String, Style {
        case workSans = "workSans, sans-serif"
        case lora = "lora, sans-serif"

        var styleLabel: String { "font-family" }
    }

    enum Size: Style {
        case pixels(Int)

        var styleLabel: String { "font-size" }

        var styleValue: String {
            switch self {
            case .pixels(let pixels):
                "\(pixels)px"
            }
        }
    }

    enum Weight: String, Style {
        case normal
        case medium = "500"

        var styleLabel: String { "font-weight" }
    }

    let family: Family?
    let size: Size?
    let weight: Weight?

    init(_ family: Family? = nil, size: Size? = nil, weight: Weight? = nil) {
        self.family = family
        self.size = size
        self.weight = weight
    }

    var styles: [(any Style)?] {
        [family, size, weight]
    }
}
