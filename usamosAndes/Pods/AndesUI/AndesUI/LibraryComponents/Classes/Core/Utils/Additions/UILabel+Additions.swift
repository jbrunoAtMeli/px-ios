//
//  UILabel+Additions.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/9/20.
//

import UIKit
@objc public extension UILabel {
    func setAndesStyle(style: AndesFontStyle) {
        self.textColor = style.textColor
        self.font = style.font

        // set text with line height
        let attributedString = NSMutableAttributedString(string: text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = style.lineSpacing
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}
