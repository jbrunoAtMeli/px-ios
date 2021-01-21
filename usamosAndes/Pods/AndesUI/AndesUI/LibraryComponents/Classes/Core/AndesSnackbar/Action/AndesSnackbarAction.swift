//
//  AndesSnackbarAction.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

@objc public class AndesSnackbarAction: NSObject {

    /// Text shown in Snackbar Action
    let text: String

    /// Callback to be invoked when the action button is tapped and snackbar is dismissed
    let callback: (() -> Void)?

    /// Initialize the Snackbar action with the text shown in the button and the action to call when tapped
    /// - Parameters:
    ///   - text: Text shown in the snackbar action
    ///   - callback: Callback called when snackbar button is pressed. The snackbar is going to be dismissed when this callback is invoked.
    @objc public init(text: String, callback: (() -> Void)? = nil) {
        self.text = text
        self.callback = callback
        super.init()
    }
}
