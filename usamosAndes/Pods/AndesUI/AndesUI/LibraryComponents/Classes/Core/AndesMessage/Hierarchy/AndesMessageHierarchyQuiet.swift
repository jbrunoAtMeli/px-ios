//
//  AndesMessageHierarchyQuiet.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
struct AndesMessageHierarchyQuiet: AndesMessageHierarchyProtocol {
    var primaryButtonHierarchy: AndesButtonHierarchyProtocol = AndesButtonHierarchyLoud()

    var secondaryButtonHierarchy: AndesButtonHierarchyProtocol = AndesButtonHierarchyTransparent()

    var linkButtonHierarchy: AndesButtonHierarchyProtocol = LinkMessageActionButtonHierarchy(textColor: AndesStyleSheetManager.styleSheet.accentColor, pressedColor: .clear)

    var dismissButtonColor: UIColor = AndesStyleSheetManager.styleSheet.textColorPrimary

    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textColorPrimary

    var backgroundColor: UIColor = UIColor.Andes.gray040

    var pipeColor: UIColor

    var accentColor: UIColor

    var bodyLinkIsUnderline: Bool

    var bodyLinkTextColor: UIColor

    init(type: AndesMessageTypeProtocol) {
        pipeColor = type.primaryColor
        accentColor = type.primaryColor
        primaryButtonHierarchy = AndesButtonHierarchyLoud()
        secondaryButtonHierarchy = AndesButtonHierarchyTransparent()
        linkButtonHierarchy = LinkMessageActionButtonHierarchy(textColor: AndesStyleSheetManager.styleSheet.accentColor500,
                                                               pressedColor: type.linkButtonPressedColor
        )
        bodyLinkIsUnderline = false
        bodyLinkTextColor = AndesStyleSheetManager.styleSheet.accentColor500
    }
}
