//
//  RadialGradientViewController.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 07/05/24.
//

import UIKit

class RadialGradientViewController: UIViewController {
    let changeColoursButton = UIButton()
    let gradientLayer = CAGradientLayer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        style()
        layout()
    }
}

// MARK: - Setup

extension RadialGradientViewController {
    private func style() {
        gradientLayer.type = .radial
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemMint.cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        gradientLayer.frame = view.bounds
        
        view.layer.addSublayer(gradientLayer)
        
        changeColoursButton.setImage(UIImage(systemName: "wand.and.stars"), for: .normal)
        changeColoursButton.tintColor = .systemBackground
        changeColoursButton.addTarget(self, action: #selector(changeGradientColour), for: .touchUpInside)
        
        view.addSubview(changeColoursButton)
    }
    
    private func layout() {
        changeColoursButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            changeColoursButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeColoursButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Actions

extension RadialGradientViewController {
    @objc func changeGradientColour() {
        let newColours = [
            UIColor.systemTeal.cgColor,
            UIColor.yellow.cgColor,
            
        ]
        
        gradientLayer.setColours(newColours, animated: true, withDuration: 3, timingFunctionName: .default)
    }
}

// MARK: - PreviewProvider

@available (iOS 17, *)

#Preview {
    RadialGradientViewController()
}
