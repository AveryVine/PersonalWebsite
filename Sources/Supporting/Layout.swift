//
//  Layout.swift
//
//
//  Created by Avery Vine on 25/3/24.
//

import Foundation

enum Layout {
    case post, linked

    var bylineAction: String {
        switch self {
        case .post:     "Posted"
        case .linked:   "Linked"
        }
    }
}
