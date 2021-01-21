//
//  AndesTextFieldComponentLabel.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation

@objc public class AndesTextFieldComponentLabel: NSObject, AndesTextFieldLeftComponent, AndesTextFieldRightComponent {
    public private(set) var visibility: AndesTextFieldComponentVisibility = .always
    @objc public let text: String
    public internal(set) var style: AndesFontStyle = AndesTextFieldViewConfig.getInputTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)

    @objc public init(text: String) {
        self.text = text
        super.init()
    }
}
