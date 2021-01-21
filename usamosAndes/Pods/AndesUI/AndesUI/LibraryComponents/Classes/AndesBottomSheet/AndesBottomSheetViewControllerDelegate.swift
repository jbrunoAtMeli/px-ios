//
//  AndesBottomSheetViewControllerDelegate.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 04/11/2020.
//

import Foundation

@objc
public protocol AndesBottomSheetViewControllerDelegate: class {
    @objc func sheetViewController(_ sheetViewController: AndesBottomSheetViewController, heightDidChange height: CGFloat)
}
