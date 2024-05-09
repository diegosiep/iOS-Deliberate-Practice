//
//  UIColor+Util.swift
//  GradientCoreAnimation
//
//  Created by Diego Sierra on 09/05/24.
//

import UIKit


// Use the "convenience" keyword to call a designated initialiser (primary initialiser), with some of the designated initialiser's paremeter set to a default value.
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
