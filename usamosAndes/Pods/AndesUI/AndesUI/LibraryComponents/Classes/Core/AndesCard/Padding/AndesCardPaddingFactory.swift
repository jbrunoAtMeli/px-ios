//
//  AndesCardPaddingFactory.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class AndesCardPaddingFactory {
    static func provide(_ padding: AndesCardPadding) -> AndesCardPaddingProtocol {
        switch padding {
        case .none:
            return AndesCardPaddingNone()
        case .small:
            return AndesCardPaddingSmall()
        case .medium:
            return AndesCardPaddingMedium()
        case .large:
            return AndesCardPaddingLarge()
        case .xlarge:
            return AndesCardPaddingXLarge()
        }
    }
}
