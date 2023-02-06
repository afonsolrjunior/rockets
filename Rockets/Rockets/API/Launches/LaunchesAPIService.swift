//
//  LaunchesAPIService.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

final class RemoteLaunchesAPIService: APIService {
    
    private let networkEngine: NetworkEngine
    private let requestBuilder: LaunchesRequestBuilder
    private let mapper: LaunchMapper
    
    init(networkEngine: NetworkEngine, requestBuilder: LaunchesRequestBuilder, mapper: LaunchMapper) {
        self.networkEngine = networkEngine
        self.requestBuilder = requestBuilder
        self.mapper = mapper
    }
    
    func loadItems() async throws -> [LaunchViewModel] {
        
        let request = requestBuilder
            .build()
        
        let response = try await networkEngine.execute(request: request, returningType: RemoteLaunchesPagedResponse.self)
        let viewModels = response.launches.map(mapper.map)
        
        return viewModels
    }
}
