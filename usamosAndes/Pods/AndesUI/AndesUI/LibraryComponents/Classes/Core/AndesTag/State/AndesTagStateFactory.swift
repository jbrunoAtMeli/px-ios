//
//  AndesTagStateFactory.swift
//  AndesUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation

class AndesTagStateFactory {
    static func provide(_ state: AndesTagState) -> AndesTagStateProtocol {
        switch state {
        case .idle:
            return AndesTagStateIdle()
        case .selected:
            return AndesTagStateSelected()
        }
    }
}
