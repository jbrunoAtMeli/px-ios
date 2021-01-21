//
//  AndesTagLeftContentIcon.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation

@objc public class AndesTagLeftContentIcon: NSObject, AndesTagLeftContent {
    var backgroundColor: UIColor
    var icon: UIImage = UIImage()
    var iconColor: UIColor = UIColor.clear

    @objc public init(backgroundColor: UIColor, icon: UIImage, iconColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.iconColor = iconColor
        super.init()
    }

    @objc public init(backgroundColor: UIColor, andesIconName: String, iconColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.iconColor = iconColor
        super.init()
        AndesIconsProvider.loadIcon(name: andesIconName, success: { self.icon = $0 })
    }
}
