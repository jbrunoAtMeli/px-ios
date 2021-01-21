//
//  AndesTagTypeFactory.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/29/20.
//

import Foundation

class AndesTagTypeFactory {
    static func provide(_ type: AndesTagType) -> AndesTagTypeProtocol {
        switch type {
        case .neutral:
            return AndesTagTypeNeutral()
        case .error:
            return AndesTagTypeError()
        case .highlight:
            return AndesTagTypeHighlight()
        case .warning:
            return AndesTagTypeWarning()
        case .success:
            return AndesTagTypeSuccess()
        }
    }
}
