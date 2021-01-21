//
//  AndesMessageViewDefault.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/15/20.
//

import Foundation

class AndesMessageDefaultView: AndesMessageAbstractView {
    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesMessageDefaultView", owner: self, options: nil)
    }
}
