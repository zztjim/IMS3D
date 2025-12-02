//
//  ContentView.swift
//  IMS3D
//
//  Created by Zed on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) private var viewModel
        
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            EquipmentList()
                .opacity(viewModel.immersiveSpaceState == .closed ? 1 : 0)
            
            ToggleImmersiveSpaceButton().offset(x: -10, y: 10)
                //.opacity(viewModel.immersiveSpaceState == .open ? 1 : 0)
            
        }
        //.animation(.default, value: viewModel.immersiveSpaceState)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(ViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
