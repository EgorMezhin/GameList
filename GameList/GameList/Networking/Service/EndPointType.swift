//
//  EndPointType.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
