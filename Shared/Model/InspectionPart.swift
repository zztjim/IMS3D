//
//  InspectionPart.swift
//  IMS3D
//
//  Created by Zed on 12/4/24.
//

import Foundation
import SwiftData

@Model
final class InspectionPart {
    var inspection: Inspection
    var part: Part
    var codes: [Code] = []
    
    init(inspection: Inspection, part: Part) {
        self.inspection = inspection
        self.part = part
    }
    
}
