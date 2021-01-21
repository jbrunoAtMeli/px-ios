//
//  AndesTextInputPaddingFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/24/20.
//

import Foundation

class AndesTextInputPaddingFactory {
    static func providePaddingForField(state: AndesTextInputState) -> AndesTextInputPadding {
        switch state {
        case .readOnly:
            return AndesTextInputPadding(top: 13, left: 4, bottom: 13, right: 4)
        default:
            return AndesTextInputPadding.defaultPadding
        }
    }

    static func providePaddingForArea(state: AndesTextInputState) -> AndesTextInputPadding {
        switch state {
        case .readOnly:
            return AndesTextInputPadding(top: 15, left: 0, bottom: 15, right: 0)
        default:
            return AndesTextInputPadding.defaultAreaPadding
        }
    }
}
