//
//  LaunchesAPIService.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

final class RemoteLaunchesAPIService: APIService {
    
    private let networkEngine: NetworkEngine
    private var requestBuilder: LaunchesRequestBuilder
    
    init(networkEngine: NetworkEngine, requestBuilder: LaunchesRequestBuilder) {
        self.networkEngine = networkEngine
        self.requestBuilder = requestBuilder
    }
    
    func loadItems() async throws -> [LaunchViewModel] {
        
        let request = requestBuilder
            .build()
        
        let response = try await networkEngine.execute(request: request, returningType: RemoteLaunchesPagedResponse.self)
        let viewModels = response.launches.map { launch in
            LaunchViewModel(missionName: launch.name,
                            missionDate: launch.dateString,
                            missionDetails: launch.details ?? "",
                            success: launch.success,
                            missionPatchLink: launch.links.patchLinks.small ?? "")
        }
        
        return viewModels
        
    }
}
