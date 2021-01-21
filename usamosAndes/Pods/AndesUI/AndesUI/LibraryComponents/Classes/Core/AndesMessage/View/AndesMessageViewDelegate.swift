//
//  AndesMessageViewDelegate.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//

import Foundation

/// Used to route events form internal message views to AndesMessage
internal protocol AndesMessageViewDelegate: AnyObject {
    func dismissTapped()
    func primaryBtnTouchUp()
    func secondaryBtnTouchUp()
}
