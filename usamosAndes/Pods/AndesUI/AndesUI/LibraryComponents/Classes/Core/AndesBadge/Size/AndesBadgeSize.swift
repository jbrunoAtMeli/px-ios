//
//  AndesBadgeSize.swift
//  AndesUI
//

/**
 The AndesBadgeSize contains the differents sizes that a badge supports
 */
@objc public enum AndesBadgeSize: Int, AndesEnumStringConvertible {
    case small
    case large

    public static func keyFor(_ value: AndesBadgeSize) -> String {
        switch value {
        case .small: return "SMALL"
        case .large: return "LARGE"
        }
    }
}
