//
//  RemoteLaunch.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

struct RemoteLaunch: Decodable {
    let id: String
    let name: String
    let details: String?
    let dateString: String
    let success: Bool
    let flightNumber: Int
    let payloads: [RemoteLaunchPayload]
    let links: RemoteLaunchLinks
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case details
        case dateString = "date_local"
        case success
        case flightNumber = "flight_number"
        case payloads
        case links
    }
}

struct RemoteLaunchPayload: Decodable {
    let id: String
    let name: String
    let type: String
    let mass: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case mass = "mass_kg"
    }
}

struct RemoteLaunchLinks: Decodable {
    let patchLinks: RemoteLaunchPatchLinks
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

struct RemoteLaunchPatchLinks: Decodable {
    let small: String?
    
    enum CodingKeys: String, CodingKey {
        case small
    }
}
