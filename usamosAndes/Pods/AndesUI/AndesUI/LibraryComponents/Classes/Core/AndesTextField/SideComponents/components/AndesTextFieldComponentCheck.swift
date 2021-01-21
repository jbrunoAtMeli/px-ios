//
//  AndesTextFieldComponentCheck.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation

@objc public class AndesTextFieldComponentCheck: NSObject, AndesTextFieldRightComponent {
    public private(set) var visibility: AndesTextFieldComponentVisibility = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = AndesStyleSheetManager.styleSheet.feedbackColorPositive

    public override init() {
        super.init()
        AndesIconsProvider.loadIcon(name: AndesIcons.feedbackSuccess16) { self.icon = $0 }
    }
}
