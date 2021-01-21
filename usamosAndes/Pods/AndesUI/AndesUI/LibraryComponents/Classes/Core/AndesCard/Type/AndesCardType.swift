//
//  AndesCardType.swift
//  AndesUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation

/// Used to define the type of an AndesCard
@objc public enum AndesCardType: Int, AndesEnumStringConvertible {
    case none
    case highlight
    case error
    case success
    case warning

    public static func keyFor(_ value: AndesCardType) -> String {
        switch value {
        case .none: return "NONE"
        case .highlight: return "HIGHLIGHT"
        case .error: return "ERROR"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        }
    }
}
