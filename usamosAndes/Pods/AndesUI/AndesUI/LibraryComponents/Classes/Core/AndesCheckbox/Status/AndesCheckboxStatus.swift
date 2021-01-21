//
//  AndesCheckboxStatus.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
/// Used to set the checkbox status
@objc public enum AndesCheckboxStatus: Int, AndesEnumStringConvertible {
    case selected
    case unselected
    case undefined

    public static func keyFor(_ value: AndesCheckboxStatus) -> String {
        switch value {
        case .selected: return "SELECTED"
        case .unselected: return "UNSELECTED"
        case .undefined: return "UNDEFINED"
        }
    }
}
