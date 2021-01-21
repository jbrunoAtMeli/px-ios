//
//  AndesCheckboxTypeFactory.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation

class AndesCheckboxTypeFactory {
    static func provide(_ type: AndesCheckboxType, status: AndesCheckboxStatus) -> AndesCheckboxTypeProtocol {
        switch type {
        case .disabled:
            return AndesCheckboxTypeDisabled(status: status)
        case .idle:
            return AndesCheckboxTypeIdle(status: status)
        case .error:
            return AndesCheckboxTypeError()
        }
    }
}
