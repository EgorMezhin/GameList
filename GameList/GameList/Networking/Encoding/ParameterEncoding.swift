//
//  ParameterEncoding.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

import Foundation

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
