//
//  AndesRadioButtonType.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/// Used to set the radiobutton type
@objc public enum AndesRadioButtonType: Int, AndesEnumStringConvertible {
    case idle
    case disabled
    case error

    public static func keyFor(_ value: AndesRadioButtonType) -> String {
        switch value {
        case .idle: return "IDLE"
        case .disabled: return "DISABLED"
        case .error: return "ERROR"
        }
    }
}
