//
//  GameSearchBody.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import Foundation

struct GameSearchBodyRequest: Requestable {
    let body: String
    init(text: String) {
        self.body = """
        fields *; search "\(text)";
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

protocol Requestable {
    var body: String { get }
}
