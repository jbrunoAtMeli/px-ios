//
//  AndesButtonSizeFactory.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
//

import Foundation

/**
 The responsability of the factory is to provide the right size by providing the AndesButtonSize
 */
class AndesButtonSizeFactory {
    static func provideStyle(key: AndesButtonSize, icon: AndesButtonIcon?) -> AndesButtonSizeProtocol {
        switch key {
        case .large:
            return AndesButtonSizeLarge()
        case .medium:
            return AndesButtonSizeMedium()
        case .small:
            return AndesButtonSizeSmall()
        }
    }
}
