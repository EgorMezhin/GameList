//
//  JSONParameterEncoder.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodeError
        }
    }
}

struct UTF8ParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        if let data = parameters.data(using: .utf8, allowLossyConversion: false) {
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        } else {
            throw NetworkError.encodeError
        }
    }
}


