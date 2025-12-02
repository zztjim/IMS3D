//
//  Part.swift
//  IMS3D
//
//  Created by Zed on 11/11/24.
//
import Foundation
import SwiftData

@Model
final class Part {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Part(name: "Bearing"),
        Part(name: "Roller"),
        Part(name: "Belt"),
    ]
}

