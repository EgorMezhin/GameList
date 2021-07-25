//
//  GameSearchBody.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import Foundation

struct GameSearchBody {
    let body: String
    init(text: String) {
        self.body = """
        fields *; search "\(text)";
        """
    }
}
