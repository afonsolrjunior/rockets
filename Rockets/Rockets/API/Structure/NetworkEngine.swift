//
//  NetworkEngine.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case decoding(error: Error)
    case invalidStatusCode
    case custom(errorMessage: String)
}

final class NetworkEngine {
    
    private let urlSession: URLSession
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func execute<T: Decodable>(request: any Request, returningType: T.Type) async throws -> T {
        
        guard let url = request.endpoint.components.url else { throw APIError.invalidUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.endpoint.method.rawValue
        urlRequest.httpBody = try encoder.encode(request.body)
        
        let response = try await self.urlSession.data(for: urlRequest)
        
        guard let httpResponse = response.1 as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.invalidStatusCode
        }
        
        let data = response.0
       
        do {
            let decodeObject = try decoder.decode(T.self, from: data)
            return decodeObject
        } catch {
            throw APIError.decoding(error: error)
        }
        
    }
    
}
