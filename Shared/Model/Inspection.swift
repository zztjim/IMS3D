//
//  Inspection.swift
//  IMS3D
//
//  Created by Zed on 11/11/24.
//

import Foundation
import SwiftData

@Model
final class Inspection {
    var maintenance: Maintenance
    var type: String
    var notes: String = ""
    
    
    init(maintenance: Maintenance, type: String) {
        self.maintenance = maintenance
        self.type = type
    }
    
    static let types: [String] = ["Preventive", "Corrective"]
    
}
