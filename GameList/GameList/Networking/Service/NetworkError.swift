//
//  NetworkError.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameters encoding failed"
    case missingURL = "URL is nil"
}
