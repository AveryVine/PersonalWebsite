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
        NavigationBar {
            Link("Cyclo", target: "/cyclo")
                .padding(.trailing, .medium)
            Link("Droplet", target: "/droplet")
                .padding(.trailing, .medium)
        }
        .navigationBarStyle(.dark)
        .backgroundColor(Color(hex: "#343a40"))
        .position(.fixedTop)
    }
}
