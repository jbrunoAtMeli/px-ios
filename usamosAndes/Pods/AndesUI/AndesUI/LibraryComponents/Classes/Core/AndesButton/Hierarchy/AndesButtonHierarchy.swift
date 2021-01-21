//
//  AndesButtonStyle.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
//

import Foundation

/**
The AndesButtonSize contains the differents styles that a button supports
*/
@objc public enum AndesButtonHierarchy: Int, AndesEnumStringConvertible {
    case loud
    case quiet
    case transparent

    public static func keyFor(_ value: AndesButtonHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        case .transparent: return "TRANSPARENT"
        }
    }
}
