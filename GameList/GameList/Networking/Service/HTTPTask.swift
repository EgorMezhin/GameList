//
//  HTTPTask.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case request
    case requestParameters(
            bodyParameters: Parameters?,
            urlParameters: Parameters?
         )
    case requestParametersAndHeaders(
            bodyParameters: Parameters?,
            urlParameters: Parameters?,
            additionalHeaders: HTTPHeaders?
            )
    
}
