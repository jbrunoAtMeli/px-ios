//
//  AndesCheckboxAlign.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
/// Used to set the checkbox align
@objc public enum AndesCheckboxAlign: Int, AndesEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: AndesCheckboxAlign) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}
