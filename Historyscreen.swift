import SwiftUI

struct HistoryScreen: View {
    let pastPredictions: [String] = [
        "Prediction: Malignant on July 14, 2025",
        "Prediction: Benign on July 13, 2025"
    ]

    var body: some View {
        List(pastPredictions, id: \.self) { item in
            Text(item)
        }
        .navigationTitle("Prediction History")
    }
}
