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
        fields id, name, first_release_date, genres, summary, url, involved_companies, rating, cover.url; search "\(text)";
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
