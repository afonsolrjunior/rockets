//
//  Launch.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

struct Launch: Decodable {
    
    let id: String
    let name: String
    let details: String
    let dateString: String
    let success: Bool
    let flightNumber: Int
    let links: LaunchLinks
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case details
        case dateString = "date_local"
        case success
        case flightNumber = "flight_number"
        case links
    }
    
}

struct LaunchLinks: Decodable {
    let patchLinks: LaunchPatchLinks
    let webcast: String
    let article: String
    let wikipedia: String
    
    enum CodingKeys: String, CodingKey {
        case patchLinks = "patch"
        case webcast
        case article
        case wikipedia
    }
    
}

struct LaunchPatchLinks: Decodable {
    let small: String?
    
    enum CodingKeys: String, CodingKey {
        case small
    }
}
