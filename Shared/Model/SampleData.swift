//
//  SampleData.swift
//  IMS3D
//
//  Created by Zed on 10/18/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Equipment.self,
            Maintenance.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
//        for item in Equipment.sampleData {
//            context.insert(item)
//        }
        for item in Maintenance.sampleData {
            context.insert(item)
        }
        
        Equipment.sampleData[0].modelName = "Electric Motor M580"
        Equipment.sampleData[1].modelName = "Reducer R096"
        Equipment.sampleData[1].location = "42,0,0,0.02, 0.02, 0.02"
        
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
    
}
