//
//  AndesBadgeBorder.swift
//  AndesUI
//

import Foundation

/// Used to define the kind or border of an AndesBadge
@objc public enum AndesBadgeBorder: Int, AndesEnumStringConvertible {
    case standard
    case corner
    case rounded

    public static func keyFor(_ value: AndesBadgeBorder) -> String {
        switch value {
        case .standard: return "STANDARD"
        case .corner: return "CORNER"
        case .rounded: return "ROUNDED"
        }
    }
}
