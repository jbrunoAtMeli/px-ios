//
//  AndesIconsLocalStrategy.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//

import Foundation
class AndesIconsLocalStrategy: AndesIconsStrategy {
    func loadIcon(name: String, success: (UIImage) -> Void, failure: ((Error?) -> Void)?) {
        let main = Bundle(for: AndesBundle.self)
        guard let bundlePath = main.resourceURL?.appendingPathComponent("AndesIcons.bundle"),
              let iconsBundle = Bundle(url: bundlePath),
              let icon = UIImage(named: name, in: iconsBundle, compatibleWith: nil) else {
            failure?(nil)
            return
        }

        success(icon)
    }
}
