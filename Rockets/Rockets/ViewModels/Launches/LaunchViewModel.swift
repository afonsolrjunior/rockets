//
//  LaunchViewModel.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

struct LaunchViewModel {
    let missionName: String
    let missionDate: String
    let missionDetails: String
    let success: Bool
    let missionPatchLink: String
    
    init(missionName: String, missionDate: String, missionDetails: String, success: Bool, missionPatchLink: String) {
        self.missionName = missionName
        self.missionDate = missionDate
        self.missionDetails = missionDetails
        self.success = success
        self.missionPatchLink = missionPatchLink
    }
}
