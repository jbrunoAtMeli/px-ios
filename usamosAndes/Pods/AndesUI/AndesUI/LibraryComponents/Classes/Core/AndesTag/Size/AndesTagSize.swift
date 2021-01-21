//
//  AndesTagSize.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/27/20.
//

import Foundation

@objc public enum AndesTagSize: Int, AndesEnumStringConvertible {
    case small
    case large

    public static func keyFor(_ value: AndesTagSize) -> String {
        switch value {
        case .small:
            return "SMALL"
        case .large:
            return "LARGE"
        }
    }
}
