//
//  AndesTextFieldStateError.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
struct AndesTextFieldStateError: AndesTextFieldStateProtocol {
    var borderColor = AndesStyleSheetManager.styleSheet.feedbackColorNegative
    var borderWidth: CGFloat = 1
    var borderDashed: Bool = false

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorNegative

    var helperColor = AndesStyleSheetManager.styleSheet.textColorNegative
    var helperIconTintColor: UIColor? = AndesStyleSheetManager.styleSheet.textColorWhite
    var helperIconName: String? = "andes_ui_feedback_error_16"
    var helperSemibold: Bool = true

    var backgroundColor = AndesStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            backgroundColor = AndesStyleSheetManager.styleSheet.bgColorWhite
            borderWidth = 2
        }
    }
}
