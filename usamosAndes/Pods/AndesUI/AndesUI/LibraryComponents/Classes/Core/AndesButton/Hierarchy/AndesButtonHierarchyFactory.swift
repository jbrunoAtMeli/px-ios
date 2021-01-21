//
//  AndesButtonStyleFactory.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
//

import Foundation

/**
The responsability of the factory is to provide the right style by providing the AndesButtonSize
*/
class AndesButtonHierarchyFactory {
    static func provideStyle(key: AndesButtonHierarchy) -> AndesButtonHierarchyProtocol {
        switch key {
        case .loud:
            return AndesButtonHierarchyLoud()
        case .quiet:
            return AndesButtonHierarchyQuiet()
        case .transparent:
            return AndesButtonHierarchyTransparent()
        }

    }

}
