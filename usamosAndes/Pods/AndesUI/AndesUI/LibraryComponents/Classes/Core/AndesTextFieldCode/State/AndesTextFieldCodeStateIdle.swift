//
//  AndesTextFieldCodeStateIdle.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

struct AndesTextFieldCodeStateIdle: AndesTextFieldCodeStateProtocol {
    var labelTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var helperTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorSecondary
    var helperSemibold: Bool = false
    var helperIconName: String?
    var helperIconTintColor: UIColor? = AndesStyleSheetManager.styleSheet.textColorSecondary
    var helperIconBgColor: UIColor = AndesStyleSheetManager.styleSheet.textColorSecondary
}
