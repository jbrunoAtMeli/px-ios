//
//  AndesTextFieldCodeStateDisabled.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

struct AndesTextFieldCodeStateDisabled: AndesTextFieldCodeStateProtocol {
    var labelTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var helperTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var helperSemibold: Bool = false
    var helperIconName: String?
    var helperIconTintColor: UIColor?
    var helperIconBgColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
}
