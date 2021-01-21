//
//  AndesTextFieldLeftComponentProtocol.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation

/// Component that can be placed on the left side of an AndesTextField
@objc public protocol AndesTextFieldLeftComponent {
    var visibility: AndesTextFieldComponentVisibility { get }
}
