//
//  Games.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import Foundation

struct Game: Codable {
    let id: Int
    let cover: Cover?
    let firstReleaseDate: Int?
    let genres: [Int]?
    let name: String
    let summary: String?
    let url: String
    let involvedCompanies: [Int]?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case cover
        case firstReleaseDate = "first_release_date"
        case genres
        case name
        case summary
        case url
        case involvedCompanies = "involved_companies"
        case rating
    }
}

struct Cover: Codable {
    let id: Int
    let url: String
}

//struct Genre: Codable {
//    let name: String
//}
