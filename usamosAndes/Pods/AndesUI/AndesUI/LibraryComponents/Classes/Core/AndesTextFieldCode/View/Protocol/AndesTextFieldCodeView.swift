//
//  AndesTextFieldCodeView.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesTextFieldCode.
 */
protocol AndesTextFieldCodeView: UIView {
    var text: String { get }
    var delegate: AndesTextFieldCodeDelegate? { get set }
    func setText(_ newValue: String)
    func update(withConfig config: AndesTextFieldCodeViewConfig)
    func setFocus()
    func removeFocus()
}
