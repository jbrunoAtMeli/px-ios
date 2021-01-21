//
//  AndesMessageViewConfigFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/22/20.
//

import Foundation
internal class AndesMessageViewConfigFactory {
    static func provideConfig(for message: AndesMessage) -> AndesMessageViewConfig {
        let typeIns = AndesMessageTypeFactory.provide(message.type)
        let hierarchyIns = AndesMessageHierarchyFactory.provide(message.hierarchy, forType: typeIns)

        var config = AndesMessageViewConfig(backgroundColor: hierarchyIns.backgroundColor, pipeColor: hierarchyIns.pipeColor, textColor: hierarchyIns.textColor, titleText: message.title, bodyText: message.body, icon: typeIns.icon, iconBackgroundColor: hierarchyIns.accentColor, isDismissable: message.isDismissable, dismissIconColor: hierarchyIns.textColor, bodyLinks: message.bodyLinks, bodyLinkIsUnderline: hierarchyIns.bodyLinkIsUnderline, bodyLinkTextColor: hierarchyIns.bodyLinkTextColor)

        if let primaryText = message.primaryActionText, !primaryText.isEmpty {
            config.primaryActionConfig = AndesButtonViewConfigFactory.provide(hierarchy: hierarchyIns.primaryButtonHierarchy, size: AndesButtonSizeMedium(), text: primaryText, icon: nil)
        }

        if let secondaryText = message.secondaryActionText, !secondaryText.isEmpty {
            config.secondaryActionConfig = AndesButtonViewConfigFactory.provide(hierarchy: hierarchyIns.secondaryButtonHierarchy, size: AndesButtonSizeMedium(), text: secondaryText, icon: nil)
        }

        if let linkText = message.linkActionText, !linkText.isEmpty {
            let textAttr: [NSAttributedString.Key: Any] = message.hierarchy == .loud ? [.underlineStyle: NSUnderlineStyle.single.rawValue] : [:]

            config.linkActionConfig = AndesButtonViewConfigFactory.provide(hierarchy: hierarchyIns.linkButtonHierarchy,
                                                                           size: AndesLinkButtonSizeMedium(),
                                                                           text: linkText,
                                                                           textattributes: textAttr,
                                                                           icon: nil)
        }

        return config
    }
}
