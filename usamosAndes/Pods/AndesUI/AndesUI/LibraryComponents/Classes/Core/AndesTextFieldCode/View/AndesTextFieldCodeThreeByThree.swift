//
//  AndesTextFieldCodeThreeByThree.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 18/09/2020.
//

import Foundation

final class AndesTextFieldCodeThreeByThree: AndesTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextFieldCodeThreeByThree", owner: self, options: nil)
    }
}
