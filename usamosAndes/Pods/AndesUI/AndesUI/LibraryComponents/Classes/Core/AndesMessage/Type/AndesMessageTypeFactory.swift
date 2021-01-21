//
//  AndesMessageTypeFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeFactory {
    static func provide(_ type: AndesMessageType) -> AndesMessageTypeProtocol {
        switch type {
        case .neutral:
            return AndesMessageTypeHightlight()
        case .warning:
            return AndesMessageTypeWarning()
        case .error:
            return AndesMessageTypeError()
        case .success:
            return AndesMessageTypeSuccess()
        }
    }
}
