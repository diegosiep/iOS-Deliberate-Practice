//
//  AnimatedGradientViewController3.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 05/05/24.
//

import UIKit

class AnimatedGradientExample3ViewController: UIViewController {
    var changeGradientColourButton: UIButton!
    
    let linearGradientView = LinearGradientView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func loadView() {
        super.loadView()
        view = linearGradientView
    }
}

// MARK: - Style and layout methods

extension AnimatedGradientExample3ViewController {
    private func style() {
        changeGradientColourButton = UIButton()
        changeGradientColourButton.setImage(UIImage(systemName: "wand.and.stars"), for: .normal)
        changeGradientColourButton.tintColor = UIColor.systemBackground
        changeGradientColourButton.addTarget(self, action: #selector(changeGradientColours), for: .touchUpInside)
        
        view.addSubview(changeGradientColourButton)
        
        changeGradientColourButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            changeGradientColourButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeGradientColourButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Views

extension AnimatedGradientExample3ViewController {
    class LinearGradientView: UIView {
        let topColour = UIColor.systemPurple
        let bottomColour = UIColor.systemCyan
        
        let gradientLayer = CAGradientLayer()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
        }
        
        private func commonInit() {
            gradientLayer.colors = [topColour.cgColor, bottomColour.cgColor]
            layer.addSublayer(gradientLayer)
        }
        
        func changeColours() {
            let newColors = [
                UIColor.purple.cgColor,
                UIColor.red.cgColor,
                UIColor.orange.cgColor
            ]
            
            gradientLayer.setColours(newColors,
                                     animated: true,
                                     withDuration: 2,
                                     timingFunctionName: .linear)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            if gradientLayer.frame != bounds {
                gradientLayer.frame = bounds
                
            }
        }
        
    }
}

// MARK: - Actions

extension AnimatedGradientExample3ViewController {
    @objc func changeGradientColours() {
        linearGradientView.changeColours()
        
    }
}

// MARK: - PreviewProvider

@available (iOS 17, *)

#Preview {
    AnimatedGradientExample3ViewController()
}
