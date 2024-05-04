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
    var name = "Avery Vine"
    var baseTitle = " – Avery Vine"
    var url = URL("https://www.averyvine.com")

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .yaml]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://www.averyvine.com/images/favicon.png", width: 32, height: 32))
    var author = "Avery Vine"

    var homePage = Home()
    var allPostsPage = AllPosts()
    var workPage = Work()
    var projectsPage = Projects()
    var cycloPage = Cyclo()
    var tagPage = Tags()
    var theme = MainTheme()

    var pages: [any StaticPage] {
        homePage
        allPostsPage
        workPage
        projectsPage
        cycloPage
    }

    var layouts: [any ContentPage] {
        Post()
        Linked()
    }
}


