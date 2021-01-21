//
//  AndesTextFieldCodeStateFactory.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

final class AndesTextFieldCodeStateFactory {
    static func getState(_ state: AndesTextFieldCodeState) -> AndesTextFieldCodeStateProtocol {
        switch state {
        case .IDLE:
            return AndesTextFieldCodeStateIdle()
        case .ERROR:
            return AndesTextFieldCodeStateError()
        case .DISABLED:
            return AndesTextFieldCodeStateDisabled()
        }
    }
}
