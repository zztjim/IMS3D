//
//  Equipment.swift
//  IMS3D
//
//  Created by Zed on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Equipment {
    var code: String
    var name: String
    var location: String = ""
    var uncertainty: Double = Double.random(in: 0...1)
    var modelName: String = ""
    
    @Relationship(inverse: \Maintenance.equipment) var maintenances = [Maintenance]()
    
    private var locationValues: [Float] {
        var values: [Float] = [0,0,0,1,1,1]
        let components = location.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        for index in 0..<values.count {
            if index < components.count {
                if let value = Float(components[index]) {
                    values[index] = value
                }
            }
        }
        return values
    }
    
    var position: SIMD3<Float> {
        SIMD3(locationValues[0...2])
    }
    
    var scale: SIMD3<Float> {
        SIMD3(locationValues[3...5])
    }
    
    init(code: String, name: String = "") {
        self.code = code
        self.name = name.isEmpty ? code : name
    }
    
    static let sampleData = [
        Equipment(code: "EQ1", name: "Electric Motor M580"),
        Equipment(code: "EQ2", name: "Reducer R096"),
        Equipment(code: "EQ3", name: "Conveyor C900"),
        Equipment(code: "EQ4", name: "Conveyor C800"),
        Equipment(code: "EQ5", name: "Mining Train T550"),
    ]
}
