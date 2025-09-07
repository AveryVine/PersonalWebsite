import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() {
        let site = PersonalWebsite()

        do {
            try site.publish(buildDirectoryPath: "public")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PersonalWebsite: Site {
    static let domain: StaticString = "https://www.averyvine.com"

    var name = "Avery Vine"
    var baseTitle = " – Avery Vine"
    var url = URL(domain)

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .yaml]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://www.averyvine.com/images/favicon.png", width: 32, height: 32))
    var author = "Avery Vine"

    var homePage = Home()
    var allPostsPage = AllPosts()
    var workPage = Work()
    var appsPage = Apps()
    var cycloPage = Cyclo()
    var secretPage = Secret()
    var dropletPage = Droplet()
    var tagPage = Tags()
    var theme = MainTheme(includeAuthorAttribution: true, includeIgniteCredit: false)

    var pages: [any StaticPage] {
        homePage
        allPostsPage
        workPage
        appsPage
        dropletPage
        cycloPage
        secretPage
    }

    var layouts: [any ContentPage] {
        Post()
        Linked()
    }
}


