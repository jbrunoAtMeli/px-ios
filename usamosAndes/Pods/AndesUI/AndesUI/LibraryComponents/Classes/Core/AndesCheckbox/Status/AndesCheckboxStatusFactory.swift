//
//  AndesCheckboxStatusFactory.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
class AndesCheckboxStatusFactory {
    static func provide(_ type: AndesCheckboxStatus) -> AndesCheckboxStatusProtocol {
        switch type {
        case .selected:
            return AndesCheckboxStatusSelected()
        case .undefined:
            return AndesCheckboxStatusUndefined()
        case .unselected:
            return AndesCheckboxStatusUnselected()
        }
    }
}
