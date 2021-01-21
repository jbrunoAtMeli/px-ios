//
//  AndesCardDefaultView.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import UIKit

class AndesCardDefaultView: AndesCardAbstractView {
    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesCardDefaultView", owner: self, options: nil)
    }
}
