//
//  AndesFieldPadding.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/24/20.
//

import Foundation
internal struct AndesTextInputPadding {
    let top: CGFloat
    let left: CGFloat
    let bottom: CGFloat
    let right: CGFloat

    static var defaultPadding: AndesTextInputPadding {
        return AndesTextInputPadding(top: 13, left: 12, bottom: 13, right: 12)
    }

    static var defaultAreaPadding: AndesTextInputPadding {
        return AndesTextInputPadding(top: 15, left: 7, bottom: 15, right: 7)
    }
}
