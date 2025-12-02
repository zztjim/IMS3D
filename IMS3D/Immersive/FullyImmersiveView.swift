//
//  FullyImmersiveView.swift
//  IMS3D
//
//  Created by Zed on 11/22/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FullyImmersiveView: View {
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                
//                if let equipment = viewModel.selectedEquipment,
//                   let equipmentEntity = try? await Entity(named: equipment.modelName, in: realityKitContentBundle) {
//                    equipmentEntity.scale = equipment.scale
//                    equipmentEntity.position = equipment.position
//                    
//                    immersiveContentEntity.addChild(equipmentEntity)
//                }
                
//                immersiveContentEntity.position = viewModel.mapPosition
                content.add(immersiveContentEntity)

            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    FullyImmersiveView()
        .environment(ViewModel())
}
