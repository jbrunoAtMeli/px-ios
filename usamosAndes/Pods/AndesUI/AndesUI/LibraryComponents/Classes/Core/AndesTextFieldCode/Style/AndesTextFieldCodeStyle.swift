//
//  AndesTextFieldCodeStyle.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

@objc public enum AndesTextFieldCodeStyle: Int, AndesEnumStringConvertible {

    case THREESOME
    case FOURSOME
    case THREE_BY_THREE

    public static func keyFor(_ value: AndesTextFieldCodeStyle) -> String {
        switch value {
        case .THREESOME:
            return "THREESOME"
        case .FOURSOME:
            return "FOURSOME"
        case .THREE_BY_THREE:
            return "THREE_BY_THREE"
        }
    }
}
