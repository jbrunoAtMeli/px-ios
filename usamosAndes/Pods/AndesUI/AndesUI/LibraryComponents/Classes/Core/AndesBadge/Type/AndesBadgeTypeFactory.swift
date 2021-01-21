//
//  AndesBadgeTypeFactory.swift
//  AndesUI
//

import Foundation

class AndesBadgeTypeFactory {
    static func provide(_ type: AndesBadgeType) -> AndesBadgeTypeProtocol {
        switch type {
        case .neutral:
            return AndesBadgeTypeNeutral()
        case .highlight:
            return AndesBadgeTypeHighlight()
        case .success:
            return AndesBadgeTypeSuccess()
        case .warning:
            return AndesBadgeTypeWarning()
        case .error:
            return AndesBadgeTypeError()
        }
    }
}
