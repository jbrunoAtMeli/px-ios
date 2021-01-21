//
//  AndesSnackbarDuration.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

/// Represents the duration for Snackbar to be shown
@objc public enum AndesSnackbarDuration: Int, AndesEnumStringConvertible {

    /// For short text size, shows Snackbar for 3 seconds
    case short = 3

    /// For medium text size, shows Snackbar for 6 seconds
    case normal = 6

    /// For long texts, shows Snackbar for 10 seconds
    case long = 10

    public static func keyFor(_ value: AndesSnackbarDuration) -> String {
        switch value {
        case .short:
            return "SHORT"
        case .normal:
            return "NORMAL"
        case .long:
            return "LONG"
        }
    }
}
