// BreastCancerPredictorApp/GraphView.swift
import SwiftUI
import Charts

struct GraphView: View {
    let dummyData = [
        ("Radius Mean", 14.1),
        ("Texture Mean", 19.3),
        ("Smoothness", 0.10),
        ("Compactness", 0.14),
        ("Symmetry", 0.2)
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Feature Contribution")
                .font(.headline)

            Chart(dummyData, id: \.0) { data in
                BarMark(
                    x: .value("Feature", data.0),
                    y: .value("Value", data.1)
                )
                .foregroundStyle(data.1 > 15 ? Color.red : Color.blue)
            }
            .frame(height: 300)
            .padding()
        }
        .padding()
    }
}