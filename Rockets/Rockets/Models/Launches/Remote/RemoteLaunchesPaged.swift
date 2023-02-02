//
//  RemoteLaunchesPagedResponse.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

struct RemoteLaunchesPagedResponse: Decodable {
    let launches: [RemoteLaunch]
    let hasNextPage: Bool
    
    enum CodingKeys: String, CodingKey {
        case launches = "docs"
        case hasNextPage
    }
    
}
