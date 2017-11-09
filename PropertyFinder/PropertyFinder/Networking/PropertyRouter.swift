//
//  PropertyRouter.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//



import Alamofire
import Foundation
enum PropertyRouter: URLRequestConvertible {

    static let baseURLString = "https://www.propertyfinder.ae"
    case getList(Int, String)
    func asURLRequest() throws -> URLRequest {

        var method: HTTPMethod {
            switch self {
            case .getList:
                return .get
            }
        }
        let params: ([String: Any]?) = {
            switch self {
            case .getList(let count, let order):
                return ["page":count, "order":order]
            }
        }()

        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .getList:
                relativePath = "/mobileapi"
            }
            var url = URL(string: PropertyRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()


        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: params)

    }
}


