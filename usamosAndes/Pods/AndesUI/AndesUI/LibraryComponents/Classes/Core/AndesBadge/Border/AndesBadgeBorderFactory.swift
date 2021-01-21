//
//  AndesBadgeBorderFactory.swift
//  AndesUI
//

class AndesBadgeBorderFactory {
    static func provide(_ border: AndesBadgeBorder) -> AndesBadgeBorderProtocol {
        switch border {
        case .standard:
            return AndesBadgeBorderStandard()
        case .corner:
            return AndesBadgeBorderCorner()
        case .rounded:
            return AndesBadgeBorderRounded()
        }
    }
}
