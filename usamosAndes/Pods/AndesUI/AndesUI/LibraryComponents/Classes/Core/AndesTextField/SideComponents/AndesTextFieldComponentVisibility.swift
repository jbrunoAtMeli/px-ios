//
//  AndesTextFieldComponentVisibility.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation

@objc public enum AndesTextFieldComponentVisibility: Int, AndesEnumStringConvertible {
    case always
    case whenNotEmpty

    public static func keyFor(_ value: AndesTextFieldComponentVisibility) -> String {
        switch value {
        case .always: return "ALWAYS"
        case .whenNotEmpty: return "WHENNOTEMPTY"
        }
    }
}
