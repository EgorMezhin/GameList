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
    let genres: [Genre]?
    let name: String
    let releaseDates: [ReleaseDate]?

    enum CodingKeys: String, CodingKey {
        case id
        case cover
        case genres
        case name
        case releaseDates = "release_dates"
    }
}
struct Cover: Codable {
    let id: Int
    let url: String
}
struct ReleaseDate: Codable {
    let id: Int
    let human: String
}
struct Genre: Codable {
    let name: String
}
