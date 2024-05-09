//
//  AnimatedGradientViewController.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 05/05/24.
//

import UIKit

class AnimatedGradientExample1ViewController: UIViewController {
    var animateViewWithColoursButton: UIButton!
    
    let colour1 = UIColor.purple.cgColor
    let colour2 = UIColor.yellow.cgColor
    let colour3 = UIColor.systemRed.cgColor
    let colour4 = UIColor.systemBlue.cgColor
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        style()
        layout()

    }
}

// MARK: - Setup
extension AnimatedGradientExample1ViewController {
    private func style() {
        gradientLayer.colors = [colour1, colour2, colour3, colour4]
        gradientLayer.frame = view.bounds
        
        animateViewWithColoursButton = UIButton()
        animateViewWithColoursButton.setImage(UIImage(systemName: "wand.and.stars"), for: .normal)
        animateViewWithColoursButton.imageView?.tintColor = .systemBackground
        animateViewWithColoursButton.addTarget(self, action: #selector(animateViewController), for: .touchUpInside)
        
    }
    
    private func layout() {
        view.layer.addSublayer(gradientLayer)
        
        animateViewWithColoursButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animateViewWithColoursButton)
        
        NSLayoutConstraint.activate([
            animateViewWithColoursButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animateViewWithColoursButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}
// MARK: - Actions
extension AnimatedGradientExample1ViewController {
    @objc func animateViewController() {
        let newColours = [
            UIColor.systemMint.cgColor,
            UIColor.systemIndigo.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.white.cgColor
        ]
        
        gradientLayer.setColours(newColours, animated: true, withDuration: 3, timingFunctionName: .default)
    }
}

// MARK: - PreviewProvider

@available (iOS 17, *)

#Preview {
    AnimatedGradientExample1ViewController()
}
