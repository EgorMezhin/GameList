//
//  GameSearchBody.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import Foundation

protocol Requestable {
    var body: String { get }
}

struct GameSearchBodyRequest: Requestable {
    let body: String
    init(text: String) {
        self.body = """
                    fields name, release_dates.human, genres.name, cover.url; search "\(text)";
                    """
    }
}

struct GameByRatingBodyRequest: Requestable {
    let body: String
    init() {
        self.body = """
                    fields name, release_dates.human, genres.name, cover.url; where rating > 85;
                    """
    }
}

struct GamesResponseBody: Responsable {
    let games: [Game]?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringArray = try container.decode([Game].self)
        games = stringArray

    }
}
