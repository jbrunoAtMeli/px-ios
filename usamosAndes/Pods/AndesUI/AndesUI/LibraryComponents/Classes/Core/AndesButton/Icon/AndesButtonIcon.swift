//
//  AndesButtonIcon.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 07/01/2020.
//

import Foundation

/**
  Object model that contains the Button Icon representation
 */
@objc public class AndesButtonIcon: NSObject {
    @objc public private(set) var icon: UIImage
    @objc public private(set) var orientation: AndesButtonOrientation

    @objc public init(icon: UIImage, orientation: AndesButtonOrientation) {
        self.icon = icon
        self.orientation = orientation
    }
}

/**
 Represents the orientation of the icon in the Button, the icon can be at the right or left
 */
@objc public enum AndesButtonOrientation: Int, AndesEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: AndesButtonOrientation) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}
