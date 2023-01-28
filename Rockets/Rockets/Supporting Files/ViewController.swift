//
//  ViewController.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import UIKit

struct LaunchRequest: Request {
    let endpoint: Endpoint
    let body: RequestBody?
}

enum LaunchesEndpoint: Endpoint {
    case launches
    
    var scheme: EndpointScheme {
        switch self {
            default:
                return .https
        }
    }
    
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

class ViewController: UIViewController {
    let engine = NetworkEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selections: [String: UInt] = ["id": 1,
                                          "name": 1,
                                          "type": 1,
                                          "mass_kg": 1]
        
        let body = RequestBody(query: [:],
                               options: RequestBodyOptions(select: nil,
                                                           sort: nil,
                                                           limit: 10,
                                                           populate: [.init(path: "payloads", select: selections)]))
        
        let request = LaunchRequest(endpoint: LaunchesEndpoint.launches,
                                    body: body)
        
        Task {
            let response = try await engine.execute(request: request, returningType: LaunchesResponse.self)
            print(response)
        }
        
        
    }


}

