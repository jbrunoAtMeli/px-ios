//
//  AndesRadioButtonView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/**
Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesRadioButton
*/
internal protocol AndesRadioButtonView: UIView {
    // expose behaviour to AndesCheckbox common to all Andes Views
    var delegate: AndesRadioButtonViewDelegate? { get set }
    func update(withConfig config: AndesRadioButtonConfig)
}
