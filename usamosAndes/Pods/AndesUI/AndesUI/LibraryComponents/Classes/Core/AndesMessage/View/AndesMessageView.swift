//
//  AndesMessageView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/15/20.
//

import Foundation

/**
Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesMessage
*/

internal protocol AndesMessageView: UIView {
    // expose behaviour to AndesMessage common to all Message Views
    var delegate: AndesMessageViewDelegate? { get set }
    func update(withConfig config: AndesMessageViewConfig)
}
