//
//  AndesTagChoiceTypeFactory.swift
//  AndesUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation

class AndesTagChoiceTypeFactory {
    static func provide(_ type: AndesTagChoiceType, forState state: AndesTagStateProtocol) -> AndesTagChoiceTypeProtocol {
        switch type {
        case .simple:
            return AndesTagChoiceTypeSimple(rightButtonImageName: state.rightButtonImageName)
        case .dropdown:
            return AndesTagChoiceTypeDropDown()
        }
    }
}
