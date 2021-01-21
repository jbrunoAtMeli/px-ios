//
//  AndesBadgeHierarchyFactory.swift
//  AndesUI
//

import Foundation

internal class AndesBadgeHierarchyFactory {
    static func provide(_ hierarchy: AndesBadgeHierarchy, forType type: AndesBadgeTypeProtocol) -> AndesBadgeHierarchyProtocol {
        switch hierarchy {
        case .loud:
            return AndesBadgeHierarchyLoud(type: type)
        case .quiet:
            return AndesBadgeHierarchyQuiet(type: type)
        }
    }
}
