//
//  ContentView.swift
//  IMS3D-iOS
//
//  Created by Zed on 11/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EquipmentList()
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
