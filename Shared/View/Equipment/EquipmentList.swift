//
//  EquipmentList.swift
//  IMS3D
//
//  Created by Zed on 10/18/24.
//

import SwiftUI
import SwiftData
import RealityKit
#if os(visionOS)
import RealityKitContent
#endif

struct EquipmentList: View {
    @Environment(ViewModel.self) private var viewModel
    @Query(sort: \Equipment.code) var allEquipment: [Equipment]
    @State private var equipment: Equipment? // Single selection.
    
    var body: some View {
        NavigationSplitView {
            List(allEquipment, id: \.self, selection: $equipment) {
                Text("\($0.code): \($0.name)")
            }
            .onChange(of: equipment) {
                viewModel.selectedEquipment = equipment
            }
            .padding(.vertical)
            
            NavigationLink("AI Predictive Maintenance") {
                AIPredictView()
            }
        } detail: {
            if let equipment {
                
                #if os(visionOS)
                HStack {
                    VStack {
                        EquipmentDetail(equipment: equipment)
                            .padding(.vertical)
                            .frame(width: 400)
                        //ToggleImmersiveSpaceButton()
                    }
                    
                    Spacer()
                    
                    ZStack {
                        if !equipment.modelName.isEmpty {
                            Model3D(named: equipment.modelName, bundle: realityKitContentBundle) { model in
                                model.resizable()
                                    .scaledToFit()
                                    .rotation3DEffect(
                                        Rotation3D(
                                            eulerAngles: .init(angles: viewModel.orientation, order: .xyz)
                                        )
                                    )
                                    .accessibilitySortPriority(1)
                            } placeholder: {
                                ProgressView()
                            }
                            .dragRotation(yawLimit: .degrees(40), pitchLimit: .degrees(40))
                            .offset(z: 100)
                        }
                        
                    }
                    .frame(height: 400)
                    
                    Spacer()
                }
                
                #else
                ScrollView {
                    VStack {
                    if !equipment.modelName.isEmpty {
                                                Image(equipment.modelName)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                            }
                        EquipmentDetail(equipment: equipment)
                        //.padding(.vertical)
                        .frame(height: 550)
                        //Spacer()
                        
                    }
                }
                
                #endif
            }
            
        }
    }
}

#Preview {
    EquipmentList()
        .environment(ViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
