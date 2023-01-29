//
//  LaunchesRequest.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

struct LaunchesRequest: Request {
    let endpoint: LaunchesEndpoint
    let body: RequestBody?
}
