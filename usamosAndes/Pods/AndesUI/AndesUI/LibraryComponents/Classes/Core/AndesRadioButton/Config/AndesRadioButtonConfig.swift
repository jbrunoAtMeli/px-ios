//
//  AndesRadioButtonConfig.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/// used to define the ui of internal AndesRadioButton views
internal struct AndesRadioButtonConfig {
    var title: String?
    var tintColor: UIColor?
    var textColor: UIColor!
    var align: AndesRadioButtonAlign = AndesRadioButtonAlign.left
    var type: AndesRadioButtonTypeProtocol! = AndesRadioButtonTypeIdle()
    var filled: Bool = false

    init () {

    }

    init(for radiobutton: AndesRadioButton) {
        self.title = radiobutton.title
        self.align = radiobutton.align
        self.type = AndesRadioButtonTypeFactory.provide(radiobutton.type, status: radiobutton.status)
        self.textColor = type.textColor
        self.tintColor = type.tintColor
        self.filled = radiobutton.status == .selected && radiobutton.type != .error
    }
}
