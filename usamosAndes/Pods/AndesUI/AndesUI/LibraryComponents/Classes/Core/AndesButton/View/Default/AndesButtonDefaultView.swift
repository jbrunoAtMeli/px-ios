//
//  AndesButtonDefaultView.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 AndesButtonViewDefault is the default representation for an AndesButton, its unique responsability is to provide the size attributes to its contraints
 */
internal class AndesButtonViewDefault: AndesButtonAbstractView {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesButtonViewDefault", owner: self, options: nil)
    }

    override internal func setupSize() {
        super.setupSize()

        heightConstraint.constant = config.height
        leadingConstraint.constant = config.padding
        trailingConstraint.constant = config.padding
    }

}
