//
//  AndesRadioButtonTypeFactory.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

class AndesRadioButtonTypeFactory {
    static func provide(_ type: AndesRadioButtonType, status: AndesRadioButtonStatus) -> AndesRadioButtonTypeProtocol {
        switch type {
        case .disabled:
            return AndesRadioButtonTypeDisabled()
        case .idle:
            return AndesRadioButtonTypeIdle(status: status)
        case .error:
            return AndesRadioButtonTypeError()
        }
    }
}
