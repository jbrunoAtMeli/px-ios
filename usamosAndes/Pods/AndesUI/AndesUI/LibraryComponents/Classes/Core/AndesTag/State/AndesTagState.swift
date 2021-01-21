//
//  AndesTagState.swift
//  AndesUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation

@objc public enum AndesTagState: Int, AndesEnumStringConvertible {
    case idle
    case selected

    public static func keyFor(_ value: AndesTagState) -> String {
        switch value {
        case .idle: return "IDLE"
        case .selected: return "SELECTED"
        }
    }
}
