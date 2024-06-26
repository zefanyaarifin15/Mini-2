//
//  AnimationView.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 26/06/24.
//

import SwiftUI
import Lottie

struct AnimationView: UIViewRepresentable {
    let name:String
    let animationView = LottieAnimationView()
    let animationSpeed: Double?
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = animationSpeed ?? 0.5
        animationView.play()
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
