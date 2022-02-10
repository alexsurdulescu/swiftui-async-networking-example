//
//  ActivityEndpoint.swift
//  async-networking-example
//
//  Created by Alexandru Surdulescu on 09/02/2022.
//

import Foundation

enum ActivityEndpoint {
    case retrieve
    /// And other activity endpoints if available
}

extension ActivityEndpoint {
    /// Endpoint URL
    var url: String {
        switch self {
        case .retrieve:
            return "https://www.boredapi.com"
        }
    }
    /// Endpoint URL Path
    var path: String {
        switch self {
        case .retrieve:
            return "/api/activity"
        }
    }
    /// URL parameters
    var queryItems: [URLQueryItem] {
        switch self {
        case .retrieve:
            return [].map(URLQueryItem.init)
        }
    }
    /// HTTP Method
    var method: String {
        switch self {
        case .retrieve:
            return "GET"
        }
    }
    /// URLRequest
    var request: URLRequest {
        var urlComponents = URLComponents(string: url)!
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method
        return  request
    }
}
