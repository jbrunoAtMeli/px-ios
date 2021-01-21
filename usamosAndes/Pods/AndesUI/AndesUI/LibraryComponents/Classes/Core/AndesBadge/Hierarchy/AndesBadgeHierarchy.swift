//
//  AndesBadgeHierarchy.swift
//  AndesUI
//

import Foundation

/// Used to define the style of an AndesBadge
@objc public enum AndesBadgeHierarchy: Int, AndesEnumStringConvertible {
    case loud
    case quiet

    public static func keyFor(_ value: AndesBadgeHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        }
    }
}
