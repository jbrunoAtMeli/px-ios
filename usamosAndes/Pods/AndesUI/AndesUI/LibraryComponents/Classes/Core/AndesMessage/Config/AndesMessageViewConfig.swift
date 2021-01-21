//
//  AndesMessageViewConfig.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//

import Foundation

/// used to define the ui of internal AndesMessage views
internal struct AndesMessageViewConfig {
    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor
    var pipeColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor
    var titleText: String?
    var titleStyle: AndesFontStyle = getTitleStyle(AndesStyleSheetManager.styleSheet.textColorWhite)
    var bodyStyle: AndesFontStyle = getBodyStyle(AndesStyleSheetManager.styleSheet.textColorWhite)
    var bodyText: String?
    var maxLines: UInt16 = 0

    var icon: String?
    var iconColor: UIColor = AndesStyleSheetManager.styleSheet.textColorWhite
    var iconBackgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor600

    var isDismissable: Bool = false
    var dismissIconName: String? = AndesIcons.close20
    var dismissIconColor: UIColor = AndesStyleSheetManager.styleSheet.textColorWhite

    var primaryActionConfig: AndesButtonViewConfig?
    var secondaryActionConfig: AndesButtonViewConfig?
    var linkActionConfig: AndesButtonViewConfig?

    var bodyLinks: AndesBodyLinks?
    var bodyLinkIsUnderline: Bool = false
    var bodyLinkTextColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor500

    init(backgroundColor: UIColor, pipeColor: UIColor, textColor: UIColor, titleText: String?, bodyText: String, icon: String?, iconBackgroundColor: UIColor, isDismissable: Bool, dismissIconColor: UIColor, bodyLinks: AndesBodyLinks?, bodyLinkIsUnderline: Bool, bodyLinkTextColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.pipeColor = pipeColor

        titleStyle = AndesMessageViewConfig.getTitleStyle(textColor)
        bodyStyle = AndesMessageViewConfig.getBodyStyle(textColor)

        self.titleText = titleText
        self.bodyText = bodyText
        self.icon = icon
        self.isDismissable = isDismissable

        self.iconBackgroundColor = iconBackgroundColor
        self.dismissIconColor = dismissIconColor

        self.bodyLinks = bodyLinks
        self.bodyLinkIsUnderline = bodyLinkIsUnderline
        self.bodyLinkTextColor = bodyLinkTextColor
    }

    init() {

    }

    private static func getTitleStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16), sketchLineHeight: 20)
    }

    private static func getBodyStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 18)
    }
}
