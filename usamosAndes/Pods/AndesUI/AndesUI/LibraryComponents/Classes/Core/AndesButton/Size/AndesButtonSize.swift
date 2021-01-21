//
//  AndesButtonSize.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
//

import Foundation

/**
 The AndesButtonSize contains the differents sizes that a button supports
 */
@objc public enum AndesButtonSize: Int, AndesEnumStringConvertible {
    case large
    case medium
    case small

    public static func keyFor(_ value: AndesButtonSize) -> String {
        switch value {
        case .large: return "LARGE"
        case .medium: return "MEDIUM"
        case .small: return "SMALL"
        }
    }
}
