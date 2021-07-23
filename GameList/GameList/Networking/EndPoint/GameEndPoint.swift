//
//  GameEndPoint.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

import Foundation

enum NetworkEnvironment {
    case production
}

enum GameApi {
    case popular(page: Int)
}
