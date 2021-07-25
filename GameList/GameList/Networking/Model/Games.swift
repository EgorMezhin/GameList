//
//  Games.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

//   let games = try? newJSONDecoder().decode(Games.self, from: jsonData)

import Foundation

struct Game: Codable {
    let id: Int
    let cover: Int?
    let firstReleaseDate: Int?
    let genres: [Int]?
    let name: String
    let summary: String?
    let url: String
    let involvedCompanies: [Int]?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case cover
        case firstReleaseDate = "first_release_date"
        case genres
        case name
        case summary
        case url
        case involvedCompanies = "involved_companies"
        case rating
    }
}

typealias Games = [Game]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func gamesTask(with url: URL, completionHandler: @escaping (Games?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
