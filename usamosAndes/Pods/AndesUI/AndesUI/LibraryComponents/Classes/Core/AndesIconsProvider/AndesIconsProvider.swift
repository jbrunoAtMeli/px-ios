//
//  AndesIconsProvider.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//

import Foundation
@objc public class AndesIconsProvider: NSObject {
    // Use this to inject the provider behaviour through config providers
    internal static var strategy: AndesIconsStrategy = AndesIconsLocalStrategy()

    /// Loads an Andes icon
    /// - Parameters:
    ///   - name: icon name
    ///   - success: called icon if found
    @objc public static func loadIcon(name: String, success: (UIImage) -> Void) {
        strategy.loadIcon(name: name, success: success, failure: nil)
    }

    /// Loads an Andes icon
    /// - Parameters:
    ///   - name: icon name
    ///   - success: called if icon found
    ///   - failure: called if icon not found
    @objc public static func loadIcon(name: String, success: (UIImage) -> Void, failure: @escaping (Error?) -> Void) {
        strategy.loadIcon(name: name, success: success, failure: failure)
    }

    /// Loads an Andes icon and inserts into a UIImageView
    /// - Parameters:
    ///   - name: icon name
    ///   - placeItInto: image view to place icon into
    @objc public static func loadIcon(name: String, placeItInto: UIImageView) {
        strategy.loadIcon(name: name, success: {
            placeItInto.image = $0
        }, failure: nil)
    }

    /// Loads an Andes icon and inserts into a UIImageView
    /// - Parameters:
    ///   - name: icon name
    ///   - placeItInto: image view to place icon into
    ///   - failure: called if icon not found
    @objc public static func loadIcon(name: String, placeItInto: UIImageView, failure: @escaping (Error?) -> Void) {
        strategy.loadIcon(name: name, success: {
            placeItInto.image = $0
        }, failure: failure)
    }
}
