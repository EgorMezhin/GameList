//
//  NetworkError.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import Foundation

enum NetworkError: String, Error {
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case decodableError
    case encodeError
}
