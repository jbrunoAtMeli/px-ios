//
//  AndesTagChoiceType.swift
//  AndesUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation

@objc public enum AndesTagChoiceType: Int, AndesEnumStringConvertible {
    case simple
    case dropdown

    public static func keyFor(_ value: AndesTagChoiceType) -> String {
        switch value {
        case .simple: return "SIMPLE"
        case .dropdown: return "DROPDOWN"
        }
    }
}
