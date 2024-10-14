//
//  AppPageNavBar.swift
//
//
//  Created by Avery Vine on 15/4/24.
//

import Foundation
import Ignite

struct AppPageNavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.svg", description: "")) {
            Link("Cyclo", target: "/cyclo")
                .padding(.trailing, .medium)
            Link("Droplet", target: "/droplet")
                .padding(.trailing, .medium)
        }
        .navigationBarStyle(.dark)
        .backgroundColor(Color(hex: "#cc4a0e"))
        .position(.fixedTop)
    }
}
