//
//  Job.swift
//
//
//  Created by Avery Vine on 14/4/24.
//

import Foundation

struct Job {
    let id: String
    let title: String
    let company: String
    let employmentPeriod: String
    let image: ImageAtPath?
    let description: String

    private init(title: String, company: String, employmentPeriod: String, image: ImageAtPath? = nil, description: String) {
        self.id = "\(company.convertedToSlug() ?? "")-\(title.convertedToSlug() ?? "")"
        self.title = title
        self.company = company
        self.employmentPeriod = employmentPeriod
        self.image = image
        self.description = description
    }
}

extension Job {
    // MARK: All Jobs
    static let allJobs = [
        apple,
        tripAdvisorBoston,
        tripAdvisorOttawa,
        travelClick,
        carletonUniversity
    ]

    // MARK: Apple
    static let apple = Job(
        title: "Localization Software Engineer",
        company: "Apple",
        employmentPeriod: "July 2020–Present",
        image: (
            path: "/images/apple.jpeg",
            description: "The rainbow stage inside of Apple Park, on a beautiful sunny day"
        ),
        description: """
At Apple, I work with a wide array of Apple softare engineering teams, international software QA centres, translators, and project managers to ensure that Apple delivers world-class software products to our international markets. In short, I help make sure Apple software products work beautifully for millions of users all over the world, in over 40 languages!

Products I’ve worked on include:
- Apple’s operating systems (iOS, macOS, etc.)
- Custom, world-class internal localization tools
- Much, much more!
"""
    )

    // MARK: TripAdvisor Boston
    static let tripAdvisorBoston = Job(
        title: "Software Engineer—Restaurants B2C",
        company: "TripAdvisor",
        employmentPeriod: "January 2019–June 2019",
        image: (
            path: "/images/tripadvisor.jpg",
            description: "One of the outside glass walls of the TripAdvisor headquarters in Boston, MA"
        ),
        description: """
TripAdvisor is the largest travel site in the world, packed with user reviews about hotels, restaurants, and attractions across every continent. As a member of the Restaurants B2C team, I was responsible for developing and maintaining restaurants-related features for the TripAdvisor iOS application.

While I was there, I got the opportunity to build upon my existing skills as an iOS developer, working with experienced colleagues to ensure I learned to use best practices to write strong, clear, and reusable Swift code. Among other things, I spent a significant portion of my time working on further advancing the new Nearby Restaurants map/list combo view that in early 2019.
"""
    )

    // MARK: TripAdvisor Ottawa
    static let tripAdvisorOttawa = Job(
        title: "Software Engineer—Restaurants B2B",
        company: "TripAdvisor Canada",
        employmentPeriod: "May 2018–August 2018",
        image: (
            path: "/images/tripadvisorCanada.jpg",
            description: "A POV shot of the lounge area of the TripAdivsor Canada building, looking over a laptop displaying code"
        ),
        description: """
TripAdvisor is the largest travel site in the world, packed with user reviews about hotels, restaurants, and attractions across every continent. As a member of the Restaurants B2B team, I worked to develop software that restaurants use to improve and customize their listings on TripAdvisor.

During my time at TripAdvisor Canada, the company launched an API to allow advertisement agencies to manage ads for their clients (restaurant owners with many locations). This project marked my first contribution to a significant coding project at a company, and it gave me the chance to put my expertise in Java to the test.
"""
    )

    // MARK: TravelClick
    static let travelClick = Job(
        title: "Integration Specialist",
        company: "TravelClick",
        employmentPeriod: "May 2017–Dec 2017",
        description: """
TravelClick is a company that specializes in solutions for the hospitality industry. The Ottawa office worked with the Guest Management Solutions (GMS) product, which sent out guest confirmation emails, allowed hotels to conduct surveys, and much more.

TravelClick was my first co-op position. I worked as an Integration Specialist - my job was to connect hotels with our databases by installing the GMS software on their servers. I monitered data feeds, wrote extensive documentation, fixed elusive bugs, and completed several significant code changes, all while ensuring clients were satisfied with our service.
"""
    )

    // MARK: Carleton University
    static let carletonUniversity = Job(
        title: "Undergraduate Research Assistant",
        company: "Carleton University",
        employmentPeriod: "May 2016–Sept 2016",
        description: """
During the summer of 2016, I volunteered to complete some research with a Computer Science professor at Carleton University, Dr. Doron Nussbaum. At the time, he was researching algorithms to find the shortest path to a moving target. The position began as volunteer work, but he was able to secure a grant for the project, allowing me to work full-time.

My time working under Dr. Nussbaum was very useful, as I was able to learn many programming best-practices, develop my critical thinking skills, and work on the clarity and conciseness of the documentation I wrote.
"""
    )
}
