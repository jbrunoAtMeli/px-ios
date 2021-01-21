//
//  AndesButtonLargeWithIcon.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 AndesButtonViewDefault is the representation for an AndesButton that has an icon, its unique responsability is carry an icon and draw it
 */
internal class AndesButtonViewWithIcon: AndesButtonAbstractView {

    @IBOutlet var icon: UIImageView!

    override internal func setupStyle() {
        super.setupStyle()

        icon.image = config.icon!.withRenderingMode(.alwaysTemplate)
        icon.highlightedImage = config.icon!.withRenderingMode(.alwaysTemplate)
        icon.tintColor = config.iconColor
    }

    override func disable() {
        super.disable()
        icon.tintColor = config.iconDisableColor
    }

    override func enable() {
        super.enable()
        icon.tintColor = config.iconColor
    }
}
