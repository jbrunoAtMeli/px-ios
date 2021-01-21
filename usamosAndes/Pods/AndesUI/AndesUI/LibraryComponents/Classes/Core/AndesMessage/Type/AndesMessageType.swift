//
//  AndesMessageType.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/13/20.
//

import Foundation

/// Used to define the colors of an AndesMessage
@objc public enum AndesMessageType: Int, AndesEnumStringConvertible {
    case neutral
    case success
    case warning
    case error

    public static func keyFor(_ value: AndesMessageType) -> String {
        switch value {
        case .neutral: return "NEUTRAL"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
