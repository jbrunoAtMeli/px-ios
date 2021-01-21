//
//  AndesCardHierarchy.swift
//  AndesUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation

/// Used to define the hierarchy of an AndesCard
@objc public enum AndesCardHierarchy: Int, AndesEnumStringConvertible {
    case primary
    case secondary
    case secondaryDark

    public static func keyFor(_ value: AndesCardHierarchy) -> String {
        switch value {
        case .primary: return "PRIMARY"
        case .secondary: return "SECONDARY"
        case .secondaryDark: return "SECONDARY_DARK"
        }
    }
}
