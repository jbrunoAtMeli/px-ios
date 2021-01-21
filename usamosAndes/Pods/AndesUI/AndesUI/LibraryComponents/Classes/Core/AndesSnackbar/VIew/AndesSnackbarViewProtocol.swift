//
//  AndesSnackbarViewProtocol.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/16/20.
//

import Foundation

protocol AndesSnackbarViewProtocol: UIView {
    var delegate: AndesSnackbarViewDelegate? { get set }
    var config: AndesSnackbarViewConfig { get set }
    func update(withConfig config: AndesSnackbarViewConfig)
    func updateButtonsLayout()
}
