//
//  AIPredictView.swift
//  IMS3D
//
//  Created by Zed on 11/20/25.
//

import SwiftUI

struct AIPredictView: View {
    @StateObject private var viewModel = AIPredictViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("AI Predictive Maintenance")
                    .font(.title2).bold()
                Spacer()
            }
            
            Button {
                viewModel.runPrediction()
            } label: {
                if viewModel.isRunning {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    Text("Run AI Check")
                        .fontWeight(.semibold)
                }
            }
            .buttonStyle(.borderedProminent)
            
            if viewModel.results.isEmpty {
                Text("Tap \"Run AI Check\" to analyze equipment status.")
                    .foregroundColor(.secondary)
                    .padding(.top, 8)
            } else {
                List(viewModel.results) { result in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(result.equipment.name)
                            .font(.headline)
                        Text("Location: \(result.equipment.location)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Failure probability: \(result.failureProbability)%")
                            .font(.subheadline)
                        Text(result.recommendation)
                            .font(.footnote)
                            .foregroundColor(.orange)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.plain)
            }
        }
        .padding()
    }
}
