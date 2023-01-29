//
//  LaunchesEndpoint.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

enum LaunchesEndpoint: Endpoint {
    case launches
    
    var baseURL: String {
        switch self {
            default:
                return "api.spacexdata.com"
        }
    }
    
    var path: String {
        let pathBase = "/v5"
        switch self {
            case .launches:
                return pathBase.appending("/launches/query")
        }
    }
    
}
