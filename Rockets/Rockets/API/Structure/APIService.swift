//
//  APIService.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

protocol APIService {
    func loadItems() async throws -> [LaunchViewModel]
}
