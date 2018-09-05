//
//  Gradient.swift
//  moviefy
//
//  Created by César Rosales on 03/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class Gradient: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
     //// General Declarations
     let context = UIGraphicsGetCurrentContext()!
     
     //// Color Declarations
     let gradientColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.000)
     
     //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [UIColor.black.cgColor, UIColor.black.blended(withFraction: 0.5, of: gradientColor).cgColor, gradientColor.cgColor] as CFArray, locations: [0.03, 0.25, 0.57])!
     
     //// Rectangle Drawing
     let rectanglePath = UIBezierPath(rect: rect)
     context.saveGState()
     rectanglePath.addClip()
     context.drawLinearGradient(gradient, start: CGPoint(x: rect.size.width/2, y: rect.size.height), end: CGPoint(x: rect.size.width/2, y: -0), options: [])
     context.restoreGState()
    }
    //*/

}

private extension UIColor {
    func blended(withFraction fraction: CGFloat, of color: UIColor) -> UIColor {
        var r1: CGFloat = 1, g1: CGFloat = 1, b1: CGFloat = 1, a1: CGFloat = 1
        var r2: CGFloat = 1, g2: CGFloat = 1, b2: CGFloat = 1, a2: CGFloat = 1
        
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(red: r1 * (1 - fraction) + r2 * fraction,
                       green: g1 * (1 - fraction) + g2 * fraction,
                       blue: b1 * (1 - fraction) + b2 * fraction,
                       alpha: a1 * (1 - fraction) + a2 * fraction);
    }
}
