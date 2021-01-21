//
//  AndesButtonLargeRightIcon.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
AndesButtonViewIconLeft is the representation for an AndesButton that has an icon on the right, its unique responsability is to load the view representation
*/
internal class AndesButtonViewIconRight: AndesButtonViewWithIcon {

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesButtonViewIconRight", owner: self, options: nil)
    }
}
