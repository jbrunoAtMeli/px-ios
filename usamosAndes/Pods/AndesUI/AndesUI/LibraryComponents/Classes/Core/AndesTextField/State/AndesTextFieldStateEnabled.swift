//
//  AndesTextFieldStateIdle.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation
struct AndesTextFieldStateIdle: AndesTextFieldStateProtocol {
    var borderColor = UIColor.Andes.gray250
    var borderWidth: CGFloat = 1
    var borderDashed = false

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary

    var helperColor = AndesStyleSheetManager.styleSheet.textColorSecondary
    var helperIconTintColor: UIColor? = AndesStyleSheetManager.styleSheet.textColorSecondary
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = AndesStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            borderColor = AndesStyleSheetManager.styleSheet.accentColor
            borderWidth = 2
        }
    }

}
