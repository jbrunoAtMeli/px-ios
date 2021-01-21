//
//  AndesRadioButtonViewDelegate.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/// Used to route events form internal checkbox views to AndesRadioButton
internal protocol AndesRadioButtonViewDelegate: AnyObject {
    func radioButtonTapped()
    func buttonAccesibilityTraits() -> UIAccessibilityTraits
}
