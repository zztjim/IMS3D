//
//  Maintenance.swift
//  IMS3D
//
//  Created by Zed on 10/18/24.
//

import Foundation
import SwiftData

@Model
final class Maintenance {
    var equipment: Equipment
    var status: String
    var nextMaintenanceDate: Date
    
    
    var inspectionType: String = Maintenance.inspectionTypes[0]
    var notes: String = ""
    
    
    init(equipment: Equipment, status: String = Maintenance.statuses[0], nextMaintenanceDate: Date = Date() + 30 * 24 * 3600) {
        self.equipment = equipment
        self.status = status
        self.nextMaintenanceDate = nextMaintenanceDate
    }
    
    static let statuses: [String] = ["In Progress", "Approved", "Disapproved"]
    
    static let inspectionTypes: [String] = ["Preventive", "Corrective"]
    
    static let sampleData = [
        Maintenance(equipment: Equipment.sampleData[0]),
        Maintenance(equipment: Equipment.sampleData[1]),
        Maintenance(equipment: Equipment.sampleData[2]),
        Maintenance(equipment: Equipment.sampleData[3]),
        Maintenance(equipment: Equipment.sampleData[4]),
    ]
}
