//
//  Style.swift
//
//
//  Created by Avery Vine on 23/3/24.
//

import Foundation

protocol Style: CustomStringConvertible {
    var styleLabel: String { get }
    var styleValue: String { get }
}

extension Style {
    var description: String {
        "\(styleLabel): \(styleValue)"
    }
}

extension Style where Self: RawRepresentable, RawValue == String {
    var styleValue: String {
        rawValue
    }
}

protocol StyleGroup {
    var styles: [Style?] { get }
}

extension StyleGroup {
    var style: String {
        styles.compactMap(\.?.description).joined(separator: "; ")
    }
}

