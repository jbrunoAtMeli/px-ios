//
//  AndesCardTypeFactory.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class AndesCardTypeFactory {
    static func provide(_ type: AndesCardType) -> AndesCardTypeProtocol {
        switch type {
        case .none:
            return AndesCardTypeNone()
        case .highlight:
            return AndesCardTypeHighlight()
        case .error:
            return AndesCardTypeError()
        case .success:
            return AndesCardTypeSuccess()
        case .warning:
            return AndesCardTypeWarning()
        }
    }
}
