//
//  ViewController.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let builder = LaunchesRequestBuilder(endpoint: .launches)
        .add(limitOption: 10)
        .add(populateOptionPath: .payloads,
             properties: RequestBodyPopulateOptionSelectKey.allCases)
    let engine = NetworkEngine()
    lazy var apiService = RemoteLaunchesAPIService(networkEngine: engine, requestBuilder: builder)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let response = try await apiService.loadItems()
            for model in response {
                print(model, separator: "\n", terminator: "\n")
            }
        }
        
    }

}

