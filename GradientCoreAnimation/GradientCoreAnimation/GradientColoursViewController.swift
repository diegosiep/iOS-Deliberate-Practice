//
//  ViewController.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 05/05/24.
//

import UIKit

class GradientColoursViewController: UIViewController {
    var goToAnimatedGradientViewController: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setGradient()
        setUp()
    }
    
}

// MARK: - Setup

extension GradientColoursViewController {
    private func setUp() {
        view.backgroundColor = .systemBackground
    }
}

// MARK: - Animation

extension GradientColoursViewController {
    
    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.layer.bounds
        gradientLayer.colors = [UIColor.systemRed.cgColor, UIColor.yellow.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.needsDisplayOnBoundsChange = true
        
        view.layer.addSublayer(gradientLayer)
    }
}

// MARK: - PreviewProvider

@available (iOS 17, *)

#Preview {
    GradientColoursViewController()
}
