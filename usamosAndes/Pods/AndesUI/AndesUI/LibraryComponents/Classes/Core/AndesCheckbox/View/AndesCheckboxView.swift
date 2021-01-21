//
//  AndesCheckboxView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

/**
Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesCheckbox
*/

internal protocol AndesCheckboxView: UIView {
    // expose behaviour to AndesCheckbox common to all Andes Views
    var delegate: AndesCheckboxViewDelegate? { get set }
    func update(withConfig config: AndesCheckboxViewConfig)

}
