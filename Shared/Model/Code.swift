//
//  Code.swift
//  IMS3D
//
//  Created by Zed on 11/11/24.
//

import Foundation
import SwiftData

@Model
final class Code {
    var code: String
    var type: String
    var title: String
    
    init(code: String, type: String, title: String) {
        self.code = code
        self.type = type
        self.title = title
    }
    
    static let types: [String] = ["Problem", "Cause", "Action"]
    
    static let sampleData = [
        Code(code: "P1", type: "Problem", title: "Shell Shaking"),
        Code(code: "C1", type: "Cause", title: "Bolt Loose"),
        Code(code: "A1", type: "Action", title: "Tighten Bolt"),
    ]
}
