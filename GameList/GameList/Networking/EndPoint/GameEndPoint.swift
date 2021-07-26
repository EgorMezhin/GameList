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
    case games(body: String)
}

extension GameApi: EndPointType {
    var environmentBaseURL: String {
        switch NetworkManager.enviroment {
        case .production: return "https://api.igdb.com/v4/"
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    var path: String {
        switch self {
        case .games:
            return "games"
        }
    }
    var httpMethod: HTTPMethod {
        return .post
    }
    var task: HTTPTask {
        switch self {
        case .games(let body):
            return .requestParametersAndHeaders(bodyParameters: body,
                                                urlParameters: nil,
                                                additionalHeaders: [
                                                    "Authorization": NetworkManager.gameApiKey,
                                                    "Client-ID": NetworkManager.gameClientId
                                                ]
            )
        }
    }
    var headers: HTTPHeaders? {
        return nil
    }
}
