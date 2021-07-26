//
//  NetworkManager.swift
//  GameList
//
//  Created by Egor Lass on 18.07.2021.
//

import Foundation

protocol Responsable: Codable {}

enum ResponseType {
    case success
    case failure
}

struct NetworkManager {
    static let enviroment: NetworkEnvironment = .production
    static let gameApiKey = "Bearer n85j23p3msyd3fm634kk5pesvb2d18"
    static let gameClientId = "hg06ldgpya6qztyomftjz57yy2b0ze"
    private let router = Router<GameApi>()

    func fetch<R: Responsable>(request: Requestable, completion: @escaping (Result<R>) -> Void) {
        router.request(.games(body: request.body)) { data, response, error in
            guard error == nil else {
                completion(.failure(.failed))
                return
            }
             if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                 switch result {
                 case .success:
                     guard let responseData = data else {
                        completion(.failure(.noData))
                         return
                     }
                     do {
                        completion(.success(try decode(data: responseData)))
                     } catch {
                        completion(.failure(.decodableError))
                     }
                 case .failure:
                    completion(.failure(handleError(response)))
                 }
             }
         }
     }

    fileprivate func decode<R: Responsable>(data: Data) throws -> R {
        let response = try JSONDecoder().decode(R.self, from: data)
        return response
    }

    fileprivate func handleError(_ response: HTTPURLResponse) -> NetworkError {
        switch response.statusCode {
        case 401...500: return .authenticationError
        case 501...599: return .badRequest
        case 600: return .outdated
        default: return .failed
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> ResponseType {
        switch response.statusCode {
        case 200...299: return .success
        default: return .failure
        }
    }
}
