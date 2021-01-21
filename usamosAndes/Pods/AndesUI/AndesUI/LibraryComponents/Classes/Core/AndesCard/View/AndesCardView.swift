//
//  AndesCardView.swift
//  AndesUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation

/**
 Internal protocol specifying the behaviour required by views to be a valid AndesCard representation
 */

internal protocol AndesCardView: UIView {
    var delegate: AndesCardViewDelegate? { get set }
    func update(withConfig config: AndesCardViewConfig)
}
