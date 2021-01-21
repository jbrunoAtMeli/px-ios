//
//  AndesCheckboxDisabledType.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation

/// Handle checkbox disabled type
class AndesCheckboxTypeDisabled: AndesCheckboxTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = UIColor.Andes.gray250
    var backgroundColor: UIColor = UIColor.Andes.gray100
    var iconColor: UIColor? = UIColor.Andes.gray250
    var cornerRadius: CGFloat = 3

    init() {}

    init(status: AndesCheckboxStatus) {
        let statusProtocol = AndesCheckboxStatusFactory.provide(status)
        if status == .unselected {
            self.backgroundColor = statusProtocol.backgroundColor
            self.borderColor = UIColor.Andes.gray100
            self.borderSize = 2
        }
    }
}
