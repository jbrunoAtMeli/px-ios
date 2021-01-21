//
//  AndesBadgeSizeFactory.swift
//  AndesUI
//

class AndesBadgeSizeFactory {
    static func provide(_ type: AndesBadgeSize) -> AndesBadgeSizeProtocol {
        switch type {
        case .large:
            return AndesBadgeSizeLarge()
        case .small:
            return AndesBadgeSizeSmall()
        }
    }
}
