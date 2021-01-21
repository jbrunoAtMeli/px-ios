//
//  AndesTagLeftContentDot.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation

@objc public class AndesTagLeftContentDot: NSObject, AndesTagLeftContent {
    var backgroundColor: UIColor
    var text: String?
    var textColor: UIColor?

    @objc public init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        super.init()
    }

    @objc public init(backgroundColor: UIColor, text: String, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.text = text
        self.textColor = textColor
        super.init()
    }
}
