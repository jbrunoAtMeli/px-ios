//
//  AndesDatePickerDefaultView.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation

internal class AndesDatePickerDefaultView: AndesDatePickerAbstractView {

    // MARK: - Instantiate

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesDatePickerDefaultView", owner: self, options: nil)
    }
}
