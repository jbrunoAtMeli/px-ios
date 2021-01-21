//
//  AndesCardHierarchyFactory.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class AndesCardHierarchyFactory {
    static func provide(_ hierarchy: AndesCardHierarchy, forStyle style: AndesCardStyleProtocol, forType type: AndesCardTypeProtocol) -> AndesCardHierarchyProtocol {
        switch hierarchy {
        case .primary:
            return AndesCardHierarchyPrimary(style: style, type: type)
        case .secondary:
            return AndesCardHierarchySecondary()
        case .secondaryDark:
            return AndesCardHierarchySecondaryDark()
        }
    }
}
