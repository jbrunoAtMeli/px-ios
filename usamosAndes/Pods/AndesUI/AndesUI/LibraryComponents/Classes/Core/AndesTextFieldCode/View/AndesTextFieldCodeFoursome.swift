//
//  AndesTextFieldCodeFoursome.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class AndesTextFieldCodeFoursome: AndesTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextFieldCodeFoursome", owner: self, options: nil)
    }
}
