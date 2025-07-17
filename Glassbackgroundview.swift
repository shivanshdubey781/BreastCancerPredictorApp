// BreastCancerPredictorApp/GlassBackgroundView.swift
import SwiftUI

struct GlassBackgroundView: View {
    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                .edgesIgnoringSafeArea(.all)

            AnimatedBubbles()
                .blur(radius: 1.5)
                .opacity(0.15)
        }
    }
}

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: blurStyle)
    }
}

struct Bubble: Identifiable {
    let id = UUID()
    let size: CGFloat
    let x: CGFloat
    let delay: Double
    let duration: Double
}

struct AnimatedBubbles: View {
    @State private var animate = false
    let bubbles: [Bubble]

    init(count: Int = 12, geometry: GeometryProxy? = nil) {
        var temp = [Bubble]()
        for i in 0..<count {
            temp.append(Bubble(
                size: CGFloat.random(in: 20...40),
                x: CGFloat.random(in: 0...(geometry?.size.width ?? 300)),
                delay: Double(i) * 0.5,
                duration: Double.random(in: 8...12)
            ))
        }
        self.bubbles = temp
    }

    var body: some View {
        GeometryReader { geometry in
            ForEach(bubbles) { bubble in
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: bubble.size, height: bubble.size)
                    .position(
                        x: bubble.x,
                        y: animate ? -50 : geometry.size.height + 50
                    )
                    .animation(
                        Animation.linear(duration: bubble.duration)
                            .repeatForever(autoreverses: false)
                            .delay(bubble.delay),
                        value: animate
                    )
            }
            .onAppear {
                animate = true
            }
        }
    }
}