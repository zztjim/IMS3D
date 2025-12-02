//
//  AIPredictViewModel.swift
//  IMS3D
//
//  Created by Zed on 11/20/25.
//

import Foundation

struct AIPredictionResult: Identifiable {
    let id = UUID()
    let equipment: Equipment
    let failureProbability: Int    // 0 - 100
    let recommendation: String
}

final class AIPredictViewModel: ObservableObject {
    @Published var equipments: [Equipment] = []
    @Published var results: [AIPredictionResult] = []
    @Published var isRunning: Bool = false
    
    init() {
        self.equipments = Equipment.sampleData
    }
    
    func runPrediction() {
        isRunning = true
        defer { isRunning = false }
        
        results = []
        
        let delay = Double.random(in: 1.0...2.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            var newResults: [AIPredictionResult] = []
            
            for equipment in self.equipments {
                let probability = Int.random(in: 40...95)
                
                let recommendation: String
                switch probability {
                case 80...100:
                    recommendation = "High risk: schedule maintenance within 24 hours."
                case 60..<80:
                    recommendation = "Medium risk: inspect within 3 days."
                default:
                    recommendation = "Low risk: continue monitoring."
                }
                
                let result = AIPredictionResult(
                    equipment: equipment,
                    failureProbability: probability,
                    recommendation: recommendation
                )
                newResults.append(result)
            }
            
            self.results = newResults
        }
    }
}
