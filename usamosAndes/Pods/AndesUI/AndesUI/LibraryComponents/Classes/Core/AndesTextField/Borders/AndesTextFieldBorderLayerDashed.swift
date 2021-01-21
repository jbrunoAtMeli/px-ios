//
//  AndesTextFieldBorderLayerDashed.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/6/20.
//

import UIKit
class AndesTextFieldBorderLayerDashed: CAShapeLayer {
    convenience init(color: UIColor, bounds: CGRect, width: CGFloat, radious: CGFloat) {
        self.init()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: radious)
        self.strokeColor = color.cgColor
        self.lineDashPattern = [2, 2]
        self.frame = bounds
        self.fillColor = nil
        self.cornerRadius = radious
        self.lineWidth = width
        self.path = path.cgPath
    }
}
