//
//  Request.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import Foundation

enum RequestBodySelectOptionDictionaryValue: Encodable {
    case text(_ value: String)
    case number(_ value: UInt)
    
    enum CodingKeys: CodingKey {
        case text
        case number
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .text(let value):
                try container.encode(value, forKey: .text)
            case .number(let value):
                try container.encode(value, forKey: .number)
        }
    }
}

struct RequestBodySelectOption: Encodable {
    let selections: [String: RequestBodySelectOptionDictionaryValue]
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(selections)
    }
    
}

enum RequestBodySortOption: String, Encodable {
    case ascending = "asc"
    case descending = "desc"
}

struct RequestBodyPopulateOption: Encodable {
    let path: String
    let select: RequestBodySelectOption
}

struct RequestBodyOptions: Encodable {
    let select: RequestBodySelectOption?
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
    
    var endpoint: Endpoint { get }
    var body: RequestBody? { get }
    
}
