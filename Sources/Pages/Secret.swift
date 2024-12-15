//
//  Secret.swift
//  PersonalWebsite
//
//  Created by Avery Vine on 15/12/24.
//

import Foundation
import Ignite

struct Secret: StaticPage {
    var title = "Secret"
    var theme = RedirectTheme(redirectPath: "famouslastwords://secret")

    func body(context: PublishingContext) -> [BlockElement] {
        Text {
            "Hi Megan 😘 open "
            Link("this page", target: "famouslastwords://secret")
            " in Famous Last Words to discover the secret!"
        }
    }
}
