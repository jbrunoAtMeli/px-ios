//
//  AndesRadioButtonTypeIdle.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import UIKit

/// Handle radioButton Idle type
class AndesRadioButtonTypeIdle: AndesRadioButtonTypeProtocol {
    var tintColor: UIColor = UIColor.Andes.gray250
    var textColor: UIColor = UIColor.Andes.gray800

    init() { }

    init(status: AndesRadioButtonStatus) {
        if status == .selected {
            self.tintColor = AndesStyleSheetManager.styleSheet.accentColor
        }
    }
}
