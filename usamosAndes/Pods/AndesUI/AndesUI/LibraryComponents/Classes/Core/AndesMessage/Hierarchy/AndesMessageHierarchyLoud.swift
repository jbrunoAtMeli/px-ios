//
//  AndesMessageHierarchyLoud.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
struct AndesMessageHierarchyLoud: AndesMessageHierarchyProtocol {
    var primaryButtonHierarchy: AndesButtonHierarchyProtocol

    var secondaryButtonHierarchy: AndesButtonHierarchyProtocol

    var linkButtonHierarchy: AndesButtonHierarchyProtocol

    var dismissButtonColor: UIColor = AndesStyleSheetManager.styleSheet.textColorWhite

    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textColorWhite

    var backgroundColor: UIColor

    var pipeColor: UIColor

    var accentColor: UIColor

    var bodyLinkIsUnderline: Bool

    var bodyLinkTextColor: UIColor

    init(type: AndesMessageTypeProtocol) {
        backgroundColor = type.primaryColor
        pipeColor = type.primaryColor
        accentColor = type.secondaryColor
        primaryButtonHierarchy = PrimaryMessageActionButtonHierarchy(backgroundColor: type.secondaryColor, pressedColor: type.primaryButtonPressedColor)
        secondaryButtonHierarchy = SecondaryMessageActionButtonHierarchy(textColor: textColor, pressedColor: type.secondaryButtonPressedColor)
        linkButtonHierarchy = LinkMessageActionButtonHierarchy(textColor: textColor, pressedColor: type.linkButtonPressedColor)
        bodyLinkIsUnderline = true
        bodyLinkTextColor = textColor
    }
}
