//
//  AndesTextFieldStateDisabled.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
struct AndesTextFieldStateDisabled: AndesTextFieldStateProtocol {
    var borderColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var borderWidth: CGFloat = 1
    var borderDashed = true

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var helperIconTintColor: UIColor?
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = UIColor.Andes.gray040
    var inputTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var editingEnabled = false

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorSecondary
}
