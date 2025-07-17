// BreastCancerPredictorApp/InputFormScreen.swift
import SwiftUI

struct InputFormScreen: View {
    @StateObject private var viewModel = PredictionViewModel()
    @State private var showResult = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Patient Information")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top)

                ForEach(viewModel.inputFields, id: \.fieldName) { field in
                    SliderInputField(title: field.fieldName, value: Binding(
                        get: { viewModel.inputs[field.fieldName] ?? field.defaultValue },
                        set: { viewModel.inputs[field.fieldName] = $0 }
                    ), range: field.range)
                }

                Button(action: {
                    viewModel.predict()
                    showResult = true
                }) {
                    Text("Predict")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink.gradient)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .shadow(color: .pink.opacity(0.5), radius: 10)
                }

                if let result = viewModel.predictionResult, showResult {
                    NavigationLink(destination: PredictionResultView(result: result), isActive: $showResult) {
                        EmptyView()
                    }.hidden()
                }
            }
            .padding()
        }
        .background(GlassBackgroundView())
        .navigationTitle("Input Form")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputFormScreen_Previews: PreviewProvider {
    static var previews: some View {
        InputFormScreen()
    }
}
