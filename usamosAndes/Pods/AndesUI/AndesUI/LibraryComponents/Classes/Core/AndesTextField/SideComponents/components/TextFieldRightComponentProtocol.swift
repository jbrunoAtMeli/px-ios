//
//  RightComponentProtocol.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/23/20.
//

import UIKit

/// Component that can be placed on the right side of an AndesTextField
@objc public protocol AndesTextFieldRightComponent {
    var visibility: AndesTextFieldComponentVisibility { get }
}
