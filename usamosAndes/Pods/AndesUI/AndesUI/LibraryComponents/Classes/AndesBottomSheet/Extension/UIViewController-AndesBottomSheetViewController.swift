//
//  UIViewController-AndesBottomSheetViewController.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 03/11/2020.
//

import Foundation

@objc
public extension UIViewController {
    var sheetViewController: AndesBottomSheetViewController? {
        var parent = self.parent
        while let currentParent = parent {
            if let sheetViewController = currentParent as? AndesBottomSheetViewController {
                return sheetViewController
            } else {
                parent = currentParent.parent
            }
        }
        return nil
    }
}
