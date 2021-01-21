//
//  AndesCardViewDelegate.swift
//  AndesUI
//
//  Created by Martin Victory on 15/07/2020.
//

import Foundation

/// Used to route events form internal card views to AndesCard
internal protocol AndesCardViewDelegate: AnyObject {
    func onLinkTouchUp()
    func onCardTouchUp()
}
