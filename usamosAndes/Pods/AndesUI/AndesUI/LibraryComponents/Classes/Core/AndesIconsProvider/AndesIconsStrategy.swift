//
//  AndesIconsStrategy.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//

import Foundation

@objc public protocol AndesIconsStrategy {
    /// Provides an icon retrieved from Images.xcassets, if not found, calls failure with nil
    /// - Parameters:
    ///   - name: icon name
    ///   - success: called if icon found
    ///   - failure: called if icon not found or error occured
    func loadIcon(name: String, success: (UIImage) -> Void, failure: ((Error?) -> Void)?)
}
