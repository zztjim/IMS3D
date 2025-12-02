//
//  IMS3DApp.swift
//  IMS3D
//
//  Created by Zed on 10/17/24.
//

import SwiftUI

/// The main entry point of the IMS3D
@main
struct IMS3DApp: App {

    @State private var viewModel = ViewModel()

    var body: some Scene {
        let container = SampleData.shared.modelContainer
        
        // a 2D window that displays a 3D model.
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .modelContainer(container)
        .windowStyle(.plain)
        
        // a mixed style immersive space that displays a 3D map
        ImmersiveSpace(id: viewModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(viewModel)
                .onAppear {
                    viewModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    viewModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        // a full style immersive space that displays a 3D map
        ImmersiveSpace(id: viewModel.fullyImmersiveSpaceID) {
            FullyImmersiveView()
                .environment(viewModel)
                .onAppear {
                    viewModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    viewModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
     }
}
