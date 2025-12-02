//
//  MaintenanceDetail.swift
//  IMS3D
//
//  Created by Zed on 10/18/24.
//

import SwiftUI

struct MaintenanceDetail: View {
    @Bindable var maintenance: Maintenance
    
    var body: some View {
        Form {
            
            Picker("Maintenance Status", selection: $maintenance.status) {
                ForEach(Maintenance.statuses, id: \.self) {
                    Text($0).tag($0)
                }
            }
            
            Picker("Inspection Type", selection: $maintenance.inspectionType) {
                ForEach(Maintenance.inspectionTypes, id: \.self) {
                    Text($0).tag($0)
                }
            }
            
            DatePicker("Next Maintenance Date", selection: $maintenance.nextMaintenanceDate, displayedComponents: .date)
            
            TextField("Notes", text: $maintenance.notes)
        }
    }
}

//#Preview(windowStyle: .automatic) {
//    MaintenanceDetail(maintenance: Maintenance.sampleData[0])
//        .environment(AppModel())
//        .modelContainer(SampleData.shared.modelContainer)
//}
