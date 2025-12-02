//
//  IMS3D_iOSApp.swift
//  IMS3D-iOS
//
//  Created by Zed on 11/20/25.
//

import SwiftUI

@main
struct IMS3D_iOSApp: App {
    
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        let container = SampleData.shared.modelContainer
        
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .modelContainer(container)
    }
}
