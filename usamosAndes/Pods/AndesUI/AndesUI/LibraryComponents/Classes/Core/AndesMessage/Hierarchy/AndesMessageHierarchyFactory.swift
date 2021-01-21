//
//  AndesMessageHierarchyFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/13/20.
//

import Foundation

internal class AndesMessageHierarchyFactory {
    static func provide(_ hierarchy: AndesMessageHierarchy, forType type: AndesMessageTypeProtocol) -> AndesMessageHierarchyProtocol {
        switch hierarchy {
        case .loud:
            return AndesMessageHierarchyLoud(type: type)
        case .quiet:
            return AndesMessageHierarchyQuiet(type: type)
        }
    }
}
