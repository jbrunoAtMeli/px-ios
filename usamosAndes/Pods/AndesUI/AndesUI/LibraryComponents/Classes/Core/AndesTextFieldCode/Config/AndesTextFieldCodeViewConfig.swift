//
//  AndesTextFieldCodeViewConfig.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

/// Used to define the UI of internal AndesTextFieldCode views.
struct AndesTextFieldCodeViewConfig {

    var labelText: String?
    var helperText: String?
    var style: AndesTextFieldCodeStyle = .THREESOME
    var state: AndesTextFieldCodeState = .IDLE
    var labelStyle: AndesFontStyle = getLabelStyle(AndesStyleSheetManager.styleSheet.textColorPrimary)
    var helperStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)
    var helperIcon: String?
    var helperIconTintColor: UIColor?
    var helperIconBgColor: UIColor?

    init(labelText: String?, helperText: String?, style: AndesTextFieldCodeStyle, state: AndesTextFieldCodeState, stateStyle: AndesTextFieldCodeStateProtocol) {
        self.labelText = labelText
        self.helperText = helperText
        self.style = style
        self.state = state
        self.labelStyle = AndesTextFieldCodeViewConfig.getLabelStyle(stateStyle)
        self.helperStyle = AndesTextFieldCodeViewConfig.getHelperTextStyle(stateStyle)
        self.helperIcon = stateStyle.helperIconName
        self.helperIconTintColor = stateStyle.helperIconTintColor
        self.helperIconBgColor = stateStyle.helperIconBgColor
    }

    init() {
    }
}

// MARK: Privates
private extension AndesTextFieldCodeViewConfig {

    static func getLabelStyle(_ stateStyle: AndesTextFieldCodeStateProtocol) -> AndesFontStyle {
        return AndesTextFieldCodeViewConfig.getLabelStyle(stateStyle.labelTextColor)
    }

    static func getHelperTextStyle(_ stateStyle: AndesTextFieldCodeStateProtocol) -> AndesFontStyle {
        AndesTextFieldCodeViewConfig.getHelperTextStyle(stateStyle.helperTextColor, semiBold: stateStyle.helperSemibold)
    }

    static func getLabelStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 14)
    }

    static func getHelperTextStyle(_ color: UIColor, semiBold: Bool = false) -> AndesFontStyle {
        let font = semiBold ? AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 13) : AndesStyleSheetManager.styleSheet.regularSystemFont(size: 13)
        return AndesFontStyle(textColor: color, font: font, sketchLineHeight: 14)
    }
}
