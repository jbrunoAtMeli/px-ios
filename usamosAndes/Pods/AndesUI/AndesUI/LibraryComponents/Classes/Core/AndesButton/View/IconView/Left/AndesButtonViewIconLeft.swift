//
//  AndesButtonLargeLeftIcon.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 AndesButtonViewIconLeft is the representation for an AndesButton that has an icon on the left, its unique responsability is to load the view representation
 */
internal class AndesButtonViewIconLeft: AndesButtonViewWithIcon {

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesButtonViewIconLeft", owner: self, options: nil)
    }
}
