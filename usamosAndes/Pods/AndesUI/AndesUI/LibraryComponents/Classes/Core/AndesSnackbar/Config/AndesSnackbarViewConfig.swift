//
//  AndesSnackbarViewConfig.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

internal struct AndesSnackbarViewConfig {

    let text: String
    let backgroundColor: UIColor
    let actionConfig: AndesButtonViewConfig?

    init() {
        self.text = ""
        self.backgroundColor = UIColor.Andes.graySolid800
        self.actionConfig = nil
    }

    init(text: String, backgroundColor: UIColor, actionConfig: AndesButtonViewConfig? = nil) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.actionConfig = actionConfig
    }
}
