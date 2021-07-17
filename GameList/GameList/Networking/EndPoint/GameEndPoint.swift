//
//  GameEndPoint.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

import Foundation

enum GameApi {
    case popular(page: Int)
    case newGames(page: Int)
}
