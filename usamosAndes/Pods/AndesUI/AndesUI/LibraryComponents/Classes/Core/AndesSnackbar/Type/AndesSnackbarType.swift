//
//  AndesSnackbarType.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

/// Tags allow you to filter content using color-based categories. A color is defined for each type.
@objc public enum AndesSnackbarType: Int, AndesEnumStringConvertible {
    case neutral
    case success
    case error

    public static func keyFor(_ value: AndesSnackbarType) -> String {
        switch value {
        case .neutral:
            return "NEUTRAL"
        case .success:
            return "SUCCESS"
        case .error:
            return "ERROR"
        }
    }

    public func toColor() -> UIColor {
        switch self {
        case .neutral:
            return UIColor.Andes.graySolid800
        case .success:
            return UIColor.Andes.green500
        case .error:
            return UIColor.Andes.red500
        }
    }
}
