//
//  AndesSelectionStyle.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 9/11/20.
//

import Foundation

@objc public enum AndesSelectionStyle: Int, AndesEnumStringConvertible {
    case gray
    case blue
    case none
    case defaultStyle

    public static func keyFor(_ value: AndesSelectionStyle) -> String {
        switch value {
        case .none: return "none"
        case .gray: return "gray"
        case .blue: return "blue"
        case .defaultStyle: return "default"
        }
    }
}
