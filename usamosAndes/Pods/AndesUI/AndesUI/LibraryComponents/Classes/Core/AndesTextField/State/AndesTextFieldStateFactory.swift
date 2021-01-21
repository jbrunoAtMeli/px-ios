//
//  AndesTextFieldStateFactory.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

internal class AndesTextFieldStateFactory {
    static func getState(_ state: AndesTextInputState, isEditing: Bool) -> AndesTextFieldStateProtocol {
        switch state {
        case .idle:
            return AndesTextFieldStateIdle(focuesd: isEditing)
        case .error:
            return AndesTextFieldStateError(focuesd: isEditing)
        case .disabled:
            return AndesTextFieldStateDisabled()
        case .readOnly:
            return AndesTextFieldStateReadonly()
        }
    }
}
