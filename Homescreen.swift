// BreastCancerPredictorApp/HomeScreen.swift
import SwiftUI
import Lottie

struct HomeScreen: View {
    @Namespace private var animation

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Breast Cancer Predictor")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.top, 40)
                    .transition(.opacity.combined(with: .scale))

                LottieView(name: "healthcare", loopMode: .loop)
                    .frame(height: 150)
                    .padding(.bottom)

                NavigationLink(destination: InputFormScreen().transition(.move(edge: .trailing)).animation(.easeInOut)) {
                    GlassCard(title: "Start Prediction", systemImage: "stethoscope")
                        .matchedGeometryEffect(id: "predict", in: animation)
                }

                NavigationLink(destination: HistoryScreen().transition(.move(edge: .trailing)).animation(.easeInOut)) {
                    GlassCard(title: "View History", systemImage: "clock")
                        .matchedGeometryEffect(id: "history", in: animation)
                }

                NavigationLink(destination: GraphView().transition(.move(edge: .trailing)).animation(.easeInOut)) {
                    GlassCard(title: "View Graphs", systemImage: "chart.bar.xaxis")
                        .matchedGeometryEffect(id: "graph", in: animation)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .background(GlassBackgroundView())
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
import SwiftUI