//
//  RedirectNavBar.swift
//
//
//  Created by Avery Vine on 15/12/24.
//

import Foundation
import Ignite

struct RedirectNavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.svg", description: "")) {}
            .navigationBarStyle(.dark)
            .navigationItemAlignment(.trailing)
            .backgroundColor(Color(hex: "#cc4a0e"))
            .position(.fixedTop)
    }
}
