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

extension GameApi: EndPointType {

    var environmentBaseURL : String {
        switch NetworkManager.enviroment {
        case .production: return "https://api.themoviedb.org/3/movie/"
        }
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .popular:
            return "popular"
        }
    }

    var httpMethod: HTTPMethod {
        return .post
    }

    var task: HTTPTask {
        switch self {
        case .popular(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page":page,
                                                      "api_key":NetworkManager.gameApiKey])
        default:
            return .request
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
