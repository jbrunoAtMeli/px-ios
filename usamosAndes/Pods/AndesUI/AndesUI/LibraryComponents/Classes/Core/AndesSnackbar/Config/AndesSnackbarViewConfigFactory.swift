//
//  AndesSnackbarConfigFactory.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

class AndesSnackbarViewConfigFactory {

    static func provideInternalConfig(from snackbar: AndesSnackbar) -> AndesSnackbarViewConfig {

        let text = snackbar.text
        let bgColor = snackbar.type.toColor()

        if let action = snackbar.action {
            let actionText = action.text
            let actionConfig = AndesButtonViewConfigFactory.provide(hierarchy: AndesSnackbarButtonHierarchy(), size: AndesSnackbarButtonSize(), text: actionText, icon: nil)
            return AndesSnackbarViewConfig(text: text, backgroundColor: bgColor, actionConfig: actionConfig)
        }

        return AndesSnackbarViewConfig(text: text, backgroundColor: bgColor)
    }
}
