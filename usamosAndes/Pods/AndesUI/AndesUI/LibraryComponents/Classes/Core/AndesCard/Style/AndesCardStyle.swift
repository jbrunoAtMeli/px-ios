//
//  AndesCardStyle.swift
//  AndesUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation

/// Used to define the style of an AndesCard
@objc public enum AndesCardStyle: Int, AndesEnumStringConvertible {
    case elevated
    case outline

    public static func keyFor(_ value: AndesCardStyle) -> String {
        switch value {
        case .elevated: return "ELEVATED"
        case .outline: return "OUTLINE"
        }
    }
}
