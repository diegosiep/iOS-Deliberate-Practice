//
//  RadialGradientCGViewController.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 08/05/24.
//


/// If you need more full control over the radial curve you can also specify it yourself in Core Graphics.

import UIKit

class RadialGradientCGViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        view = RadialGradientView()
    }
    
    
}

// MARK: - Custom classes and layers

class RadialGradientLayer: CALayer {
    var colors = [UIColor.red.cgColor, UIColor.red.cgColor] {
        didSet {
            backgroundColor = colors.last
        }
    }
    
    override init() {
        super.init()
        needsDisplayOnBoundsChange = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    //    Called everytime the device's orientation is changed (i.e. landscape to portrait or viceversa)
    override func draw(in ctx: CGContext) {
        ctx.saveGState()
        
        let center = CGPoint(x: bounds.width / 2 , y: bounds.height / 2)
        let endRadius = max(bounds.width, bounds.height) / 2
        
        var locations = [CGFloat]()
        for index in 0...colors.count - 1 {
            locations.append(CGFloat(index) / CGFloat(colors.count - 1))
        }
        
        if let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: locations) {
            ctx.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        }
    }
}

class RadialGradientView: UIView {
    let darkestColor: UIColor = .init(red: 162, green: 151, blue: 0)
    let darkerColor: UIColor = .init(red: 184, green: 172, blue: 0)
    let lighterColor: UIColor = .init(red: 216, green: 201, blue: 0)
    let lightestColor: UIColor = .init(red: 255, green: 231, blue: 0)
    
    let gradientLayer = RadialGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = darkestColor
        gradientLayer.colors = [lightestColor.cgColor, lighterColor.cgColor, darkerColor.cgColor, darkestColor.cgColor]
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
}

// MARK: - PreviewProvider

@available (iOS 17, *)

#Preview {
    RadialGradientCGViewController()
}
