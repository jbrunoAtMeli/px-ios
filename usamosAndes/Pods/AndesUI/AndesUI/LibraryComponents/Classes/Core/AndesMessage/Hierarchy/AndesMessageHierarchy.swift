//
//  AndesMessageHierarchy.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/14/20.
//

import Foundation

/// Used to define the style of an AndesMessage
@objc public enum AndesMessageHierarchy: Int, AndesEnumStringConvertible {
    case loud
    case quiet

    public static func keyFor(_ value: AndesMessageHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        }
    }
}
