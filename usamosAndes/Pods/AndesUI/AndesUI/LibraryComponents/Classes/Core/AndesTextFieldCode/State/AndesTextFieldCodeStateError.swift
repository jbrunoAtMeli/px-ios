//
//  AndesTextFieldCodeStateError.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

struct AndesTextFieldCodeStateError: AndesTextFieldCodeStateProtocol {
    var labelTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorNegative
    var helperTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorNegative
    var helperSemibold: Bool = true
    var helperIconName: String? = "andes_ui_feedback_error_16"
    var helperIconTintColor: UIColor? = AndesStyleSheetManager.styleSheet.textColorWhite
    var helperIconBgColor: UIColor = AndesStyleSheetManager.styleSheet.textColorNegative
}
