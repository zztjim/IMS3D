//
//  EquipmentDetail.swift
//  IMS3D
//
//  Created by Zed on 10/18/24.
//

import SwiftUI

struct EquipmentDetail: View {
    @Bindable var equipment: Equipment
    
    var body: some View {
        VStack {
            Form {
                TextField("Code", text: $equipment.code)
                TextField("Name", text: $equipment.name)
                TextField("Location", text: $equipment.location)
                Gauge(value: equipment.uncertainty) {
                    Text("Uncertainty")
                }
            }
            
            if let maintenances = equipment.maintenances.last {
                MaintenanceDetail(maintenance: maintenances)
            }
        }
    }
}

//#Preview {
//    EquipmentDetail()
//}
