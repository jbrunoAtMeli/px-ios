//
//  AndesTextFieldComponentIcon.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation
@objc public class AndesTextFieldComponentIcon: NSObject, AndesTextFieldRightComponent, AndesTextFieldLeftComponent {
    public private(set) var visibility: AndesTextFieldComponentVisibility = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = .clear

    @objc public convenience init(andesIconName: String, tintColor: UIColor) {
        self.init()
        AndesIconsProvider.loadIcon(name: andesIconName, success: { self.icon = $0 })
        self.tintColor = tintColor
    }

    @objc public convenience init(icon: UIImage, tintColor: UIColor) {
        self.init()
        self.icon = icon
        self.tintColor = tintColor
    }
}
