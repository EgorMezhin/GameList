//
//  Router.swift
//  GameList
//
//  Created by Egor Lass on 17.07.2021.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }

    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(
            url: route.baseURL.appendingPathComponent(route.path),
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Accept")
            case .requestParameters(
                    let bodyParameters,
                    let urlParameters):
                try self.configureParameters(
                    bodyParameters: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request
                )
            case .requestParametersAndHeaders(
                let bodyParameters,
                let urlParameters,
                let additionalHeaders
            ):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(
                    bodyParameters: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request)
            }
            return request
        } catch {
            throw error
        }
    }

    fileprivate func configureParameters(
        bodyParameters: String?,
        urlParameters: Parameters?,
        request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try UTF8ParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
        } catch {
            throw error
        }
    }

    func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    func cancel() {
        self.task?.cancel()
    }
}
