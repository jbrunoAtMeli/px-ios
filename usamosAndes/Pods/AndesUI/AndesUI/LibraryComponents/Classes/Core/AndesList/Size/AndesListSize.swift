//
//  AndesListPadding.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

@objc public enum AndesListSize: Int, AndesEnumStringConvertible {
    case small
    case medium
    case large

    public static func keyFor(_ value: AndesListSize) -> String {
        switch value {
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        }
    }
}
