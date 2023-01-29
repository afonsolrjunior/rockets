//
//  Request.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

enum RequestBodySortOption: String, Encodable {
    case ascending = "asc"
    case descending = "desc"
}

struct RequestBodyPopulateOption: Encodable, Hashable {
    let path: RequestBodyPopulateOptionPath
    let select: [RequestBodyPopulateOptionSelectKey: UInt]
}

enum RequestBodyPopulateOptionPath: String, Encodable {
    case payloads
}

enum RequestBodyPopulateOptionSelectKey: String, Encodable, CaseIterable {
    case id
    case name
    case type
    case mass = "mass_kg"
}

struct RequestBodyOptions: Encodable {
    let select: [String: UInt]?
    let sort: RequestBodySortOption?
    let limit: UInt?
    let populate: [RequestBodyPopulateOption]?
    
    enum CodingKeys: String, CodingKey {
        case select
        case sort
        case limit
        case populate
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(select, forKey: .select)
        try container.encodeIfPresent(sort, forKey: .sort)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(populate, forKey: .populate)
    }
}

struct RequestBody: Encodable {
    let query: [String: String]
    let options: RequestBodyOptions
}

protocol Request {
    associatedtype E: Endpoint
    
    var endpoint: E { get }
    var body: RequestBody? { get }
    var headers: [String: String] { get }
}

extension Request {
    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }
}
