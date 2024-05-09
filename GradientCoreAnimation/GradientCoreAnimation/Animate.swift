//
//  Animate.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 05/05/24.
//

import UIKit


extension CAGradientLayer {
    
    func setColours(_ newColours: [CGColor],
                    animated: Bool = true,
                    withDuration duration: TimeInterval = 0,
                    timingFunctionName name: CAMediaTimingFunctionName? = nil) {
        
        if !animated {
            self.colors = newColours
            return
        }
        

        let colourAnimation = CABasicAnimation(keyPath: "colors")
        colourAnimation.fromValue = colors
        colourAnimation.toValue = newColours
        colourAnimation.duration = duration
        colourAnimation.isRemovedOnCompletion = false
        colourAnimation.fillMode = CAMediaTimingFillMode.forwards
        colourAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)
        
        add(colourAnimation, forKey: "colorsChangeAnimation")
        
    }
    
}

