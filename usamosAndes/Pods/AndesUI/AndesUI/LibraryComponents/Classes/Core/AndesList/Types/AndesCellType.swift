//
//  AndesCellType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

@objc public enum AndesCellType: Int, AndesEnumStringConvertible {
    case simple
    case chevron
    case radioButton
    case checkBox

    public static func keyFor(_ value: AndesCellType) -> String {
        switch value {
        case .simple: return "SIMPLE"
        case .chevron: return "CHEVRON"
        case .radioButton: return "RADIOBUTTON"
        case .checkBox: return "CHECKBOX"
        }
    }
}
