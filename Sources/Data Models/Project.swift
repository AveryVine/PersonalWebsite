//
//  Project.swift
//
//
//  Created by Avery Vine on 4/5/24.
//

import Foundation

struct Project {
    struct Links {
        let githubURL: String?
        let appStoreURL: String?
        let webURL: String?

        init(githubURL: String? = nil, appStoreURL: String? = nil, webURL: String? = nil) {
            self.githubURL = githubURL
            self.appStoreURL = appStoreURL
            self.webURL = webURL
        }
    }

    let id: String
    let title: String
    let subtitle: String
    let image: ImageAtPath?
    let description: String
    let links: Links
    let isApp: Bool

    private init(title: String, subtitle: String, image: ImageAtPath? = nil, description: String, links: Links, isApp: Bool) {
        self.id = "\(title.convertedToSlug() ?? "")-\(subtitle.convertedToSlug() ?? "")"
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.description = description
        self.links = links
        self.isApp = isApp
    }
}

extension Project {
    // MARK: All Projects
    static let allProjects = [
        droplet,
        cyclo,
        sssc,
        wingIt,
        questsOfTheRoundTable
    ]

    // MARK: Droplet
    static let droplet = Project(
        title: "Droplet",
        subtitle: "Plant Care iOS App",
        image: (
            path: "/images/droplet.png",
            description: "Two iPhones displaying the Droplet app. The one on the left shows a collection of all of the plants in the hosuehold, highlighting those that need care today at the top. The one on the right shows details about a specific plant, including a photo, a description, and a watering/fertilizing schedule."
        ),
        description: """
Droplet is a plant care app, helping you keep track of when you need to water or fertilize your plants. It offers a beautiful, elegant, and powerful plant care experience, designed from the ground up to help you keep your plants alive.

I began working on Droplet during WWDC 2019, as I was  looking for a project to try out some of the brand new APIs that were launching that year. I took a break when returning to university, but completed the project just before I began working at Apple.
""",
        links: Links(appStoreURL: "https://apps.apple.com/app/id1466106369", webURL: "/droplet"),
        isApp: true
    )

    // MARK: SSSC iOS App
    static let sssc = Project(
        title: "Carleton University SSSC App",
        subtitle: "Science Student Success Centre Companion iOS App",
        image: (
            path: "/images/ssscapp.png",
            description: "A screenshot of the app on an iPad in portrait orientation. The left column shows a list of upcoming events, and the right column shows details for the selected event."
        ),
        description: """
As a mentor at Carleton’s Science Student Success Centre (SSSC) and a member of the Computer Science team, one of my tasks was to develop a mobile application for the centre. The app displayed all of the centre’s upcoming events (with optional pre-event notifications), provided students with quick access to the centre’s Resources page, and offered a full-fledged assignment tracker and grade calculator.

There were two components: a Swift-based mobile front-end that displayed information to the user, and a Node.js server that provided an API that the app could use to retrieve event-related information.
""",
        links: Links(githubURL: "https://github.com/AveryVine/SSSC-iOS-App", appStoreURL: "https://apple.co/33RRbim"),
        isApp: true
    )

    // MARK: Cyclo
    static let cyclo = Project(
        title: "Cyclo",
        subtitle: "WWDC 2019 Scholarship Winner",
        image: (
            path: "/images/cyclo-playgrounds.gif",
            description: "A recording of some Cyclo gameplay, being played on an iPad in the Playgrounds app (which I used to write the game)."
        ),
        description: """
Originally named Twister, I wrote this game as my application for Apple’s 2019 WWDC scholarship competition. I made it over the course of 10 days, incorporating various technologies and frameworks for the first time in any of my projects, including Swift Playgrounds, SpriteKit, and AVFoundation.

I was fortunate enough to be selected by Apple as a winner, and was able to attend WWDC 2019 in San Jose, California! Over the course of five days I attended various workshops and networked with app developers from around the world. In the months following, I also took a bit of time to convert it into a full-fledged iOS app.
""",
        links: Links(githubURL: "https://github.com/AveryVine/Twister", appStoreURL: "https://apple.co/39rNLE6", webURL: "/cyclo"),
        isApp: true
    )

    // MARK: WingIt
    static let wingIt = Project(
        title: "WingIt",
        subtitle: "News Article Political Classifier",
        image: (
            path: "/images/wingit.jpg",
            description: "A web page showing the political leaning of a news article. The top of the page shows the URL of the news article in question, the middle shows a gauge and some  text indicating the article is left-leaning, and the bottom shows suggested similar articles from left-leaning, centrist, and right-leaning news sources."
        ),
        description: """
As the final project in my Intelligent Web-based Information Systems course, we were given the freedom to explore a project topic of our choosing, as long as it integrated the course contents. My friend and I built Wing It, a web application that could determine the political leaning of a given news article through content analysis. In addition, the application recommended articles concerning similar topics from left-leaning, centrist, and right-leaning news sources.

We used a range of technologies and algorithms to complete this project including Jersey, MongoDB, crawler4j, Naive Bayes analysis, and more.
""",
        links: Links(githubURL: "https://github.com/lifeofcows/WingIt"),
        isApp: false
    )

    // MARK: Quests of the Round table
    static let questsOfTheRoundTable = Project(
        title: "Quests of the Round Table",
        subtitle: "Classic Card Game Turned Digital",
        image: (
            path: "/images/quest.png",
            description: "A digital representation of a board game. Cards shown on the board include those used in a quest, those in the player’s hand, a draw pile, and a discard pile."
        ),
        description: """
This project was a collaboration between myself and three classmates for one of my courses, Object-Oriented Software Engineering. In this card game turned digital, players vie to become the winner (Knight of the Round Table) by completing quests, participating in tournaments, and more.

I taught myself Unity and C# for the purpose of this project. In addition, as the class was focussed on the use of design patterns, I integrated several patterns including Mediator, Strategy, etc.
""",
        links: Links(githubURL: "https://github.com/JKirkYuan/Quest"),
        isApp: false
    )
}
