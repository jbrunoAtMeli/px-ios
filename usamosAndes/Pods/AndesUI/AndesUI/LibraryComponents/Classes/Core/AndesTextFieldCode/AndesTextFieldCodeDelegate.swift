//
//  AndesTextFieldCodeDelegate.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 08/10/2020.
//

import Foundation

@objc public protocol AndesTextFieldCodeDelegate: NSObjectProtocol {
    @objc optional func textDidChange(_ text: String)
    @objc optional func textDidComplete(_ isComplete: Bool)
}
