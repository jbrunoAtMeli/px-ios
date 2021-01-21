//
//  AndesCheckboxViewDelegate.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

/// Used to route events form internal checkbox views to AndesCheckbox
internal protocol AndesCheckboxViewDelegate: AnyObject {
    func checkboxTapped()
    func buttonAccesibilityTraits() -> UIAccessibilityTraits
}
