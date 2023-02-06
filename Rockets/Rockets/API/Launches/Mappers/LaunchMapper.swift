//
//  LaunchMapper.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 06/02/2023.
//

import Foundation

struct LaunchMapper {
    
    func map(remoteLaunch: RemoteLaunch) -> LaunchViewModel {
        LaunchViewModel(missionName: remoteLaunch.name,
                        missionDate: remoteLaunch.dateString,
                        missionDetails: remoteLaunch.details ?? "No Info",
                        success: remoteLaunch.success,
                        missionPatchLink: remoteLaunch.links.patchLinks.small ?? "")
    }
    
}
