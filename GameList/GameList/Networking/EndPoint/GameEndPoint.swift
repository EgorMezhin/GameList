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

// extension GameApi: EndPointType {
//    
//    var environmentBaseURL : String {
//        switch NetworkManager.enviroment {
//            case .production: return "https://api.igdb.com/v4/"
//            }
//        }
//    
//    var baseurl: URL {
//        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
//                return url
//    }
//    
//    var path: String {
//           switch self {
//           case .popular:
//               return "games"
//           }
//       }
//    
//    var httpMethod: HTTPMethod {
//        return .post
//    }
//    
//    var task: HTTPTask {
//        
//    }
//    
//    var headers: HTTPHeaders? {
//        
//    }
//    
//    
// }
