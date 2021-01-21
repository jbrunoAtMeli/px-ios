//
//  AndesCheckboxType.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
/// Used to set the checkbox type
@objc public enum AndesCheckboxType: Int, AndesEnumStringConvertible {
    case idle
    case disabled
    case error

    public static func keyFor(_ value: AndesCheckboxType) -> String {
        switch value {
        case .idle: return "IDLE"
        case .disabled: return "DISABLED"
        case .error: return "ERROR"
        }
    }
}
