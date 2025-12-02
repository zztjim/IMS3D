//
//  User.swift
//  IMS3D
//
//  Created by Zed on 11/11/24.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    static let sampleData = [
        User(name: "Zed", email: "zed@example.com", password: "password"),
        User(name: "Ace", email: "ace@example.com", password: "password"),
    ]
}
