//
//  AndesCardViewConfigFactory.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class AndesCardViewConfigFactory {
    static func provideConfig(for card: AndesCard) -> AndesCardViewConfig {
        let padding = AndesCardPaddingFactory.provide(card.padding)
        let type = AndesCardTypeFactory.provide(card.type)
        let style = AndesCardStyleFactory.provide(card.style)
        let hierarchy = AndesCardHierarchyFactory.provide(card.hierarchy, forStyle: style, forType: type)

        return AndesCardViewConfig(backgroundColor: hierarchy.backgroundColor,
                                   pipeColor: hierarchy.pipeColor,
                                   borderColor: hierarchy.borderColor,
                                   padding: padding.paddingSize,
                                   titlePadding: padding.titlePaddingSize,
                                   titleHeight: padding.titleHeight,
                                   shadow: hierarchy.cardShadow,
                                   hasCardAction: card.onCardActionPressed != nil,
                                   titleText: card.title,
                                   linkText: card.linkText,
                                   cardView: card.cardView)
    }
}
