//
//  AndesTextFieldStateReadonly.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation

struct AndesTextFieldStateReadonly: AndesTextFieldStateProtocol {
    var borderColor = UIColor.clear
    var borderWidth: CGFloat = 0
    var borderDashed: Bool = false

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = UIColor.clear
    var helperIconTintColor: UIColor?
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = UIColor.clear
    var inputTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = false
    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorDisabled
}
