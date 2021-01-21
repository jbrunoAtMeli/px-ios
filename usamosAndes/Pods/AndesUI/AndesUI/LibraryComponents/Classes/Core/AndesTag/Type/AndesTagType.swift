//
//  AndesTagType.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/27/20.
//

import Foundation

@objc public enum AndesTagType: Int, AndesEnumStringConvertible {
    case neutral
    case highlight
    case success
    case warning
    case error

    public static func keyFor(_ value: AndesTagType) -> String {
        switch value {
        case .neutral: return "NEUTRAL"
        case .highlight: return "HIGHLIGHT"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
