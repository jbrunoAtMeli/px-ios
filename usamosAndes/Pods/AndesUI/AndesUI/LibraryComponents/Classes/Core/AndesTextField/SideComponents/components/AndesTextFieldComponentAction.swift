//
//  AndesTextFieldComponentAction.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
@objc public class AndesTextFieldComponentAction: NSObject, AndesTextFieldRightComponent {
    public private(set) var visibility: AndesTextFieldComponentVisibility = .always

    @objc public private(set) var label: String

    @objc public init(_ actionLabel: String) {
        label = actionLabel
    }

}
