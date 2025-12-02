//
//  ViewModel.swift
//  IMS3D
//
//  Created by Zed on 10/17/24.
//

import SwiftUI

/// Maintains app-wide state, The data that the app uses to configure its views.
@MainActor
@Observable
class ViewModel {
    let immersiveSpaceID = "ImmersiveSpace"
    let fullyImmersiveSpaceID = "FullyImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
    
    // MARK: - Equipment
    var selectedEquipment: Equipment?
    var orientation: SIMD3<Float> = [0, -0.7, 0]
    
    // MARK: - Immersive
    var mapPosition: SIMD3<Float> = [0, 0, -1]
}
