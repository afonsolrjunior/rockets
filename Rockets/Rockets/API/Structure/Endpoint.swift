//
//  Endpoint.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

enum EndpointScheme: String {
    case http
    case https
}

enum RESTMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    var scheme: EndpointScheme { get }
    var baseURL: String { get }
    var path: String { get }
    var method: RESTMethod { get }
    var components: URLComponents { get }
}

extension Endpoint {
    var components: URLComponents {
        var components = URLComponents()
        
        components.scheme = self.scheme.rawValue
        components.host = self.baseURL
        components.path = self.path
        
        return components
    }
    
    var method: RESTMethod {
        .post
    }
    
    var scheme: EndpointScheme {
        .https
    }
    
}
