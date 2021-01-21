//
//  AndesTextFieldCodeState.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

@objc public enum AndesTextFieldCodeState: Int, AndesEnumStringConvertible {

    case IDLE
    case ERROR
    case DISABLED

    public static func keyFor(_ value: AndesTextFieldCodeState) -> String {
        switch value {
        case .IDLE:
            return "IDLE"
        case .ERROR:
            return "ERROR"
        case .DISABLED:
            return "DISABLED"
        }
    }
}
