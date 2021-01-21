//
//  AndesBadgeType.swift
//  AndesUI
//

import Foundation

/// Used to define the colors of an AndesBadge
@objc public enum AndesBadgeType: Int, AndesEnumStringConvertible {
    case neutral
    case highlight
    case success
    case warning
    case error

    public static func keyFor(_ value: AndesBadgeType) -> String {
        switch value {
        case .neutral: return "NEUTRAL"
        case .highlight: return "HIGHLIGHT"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
