//
//  AndesCheckboxViewConfig.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

/// used to define the ui of internal AndesCheckbox views
internal struct AndesCheckboxViewConfig {

    var title: String?
    var icon: String?
    var borderColor: UIColor?
    var textColor: UIColor!
    var iconColor: UIColor?
    var align: AndesCheckboxAlign = AndesCheckboxAlign.left
    var backgroundColor: UIColor = UIColor.Andes.white
    var cornerRadius: CGFloat = 3
    var borderSize: CGFloat?
    var type: AndesCheckboxTypeProtocol! = AndesCheckboxTypeIdle()
    var status: AndesCheckboxStatusProtocol! = AndesCheckboxStatusUnselected()

    init () { }

    init(for checkbox: AndesCheckbox) {
        self.title = checkbox.title
        self.align = checkbox.align
        self.status = AndesCheckboxStatusFactory.provide(checkbox.status)
        self.icon = status.icon
        self.type = AndesCheckboxTypeFactory.provide(checkbox.type, status: checkbox.status)
        self.textColor = type.textColor
        self.cornerRadius = type.cornerRadius
        self.iconColor = self.type.iconColor
        self.borderColor = type.borderColor
        self.borderSize = type.borderSize
        self.backgroundColor = type.backgroundColor
    }
}
