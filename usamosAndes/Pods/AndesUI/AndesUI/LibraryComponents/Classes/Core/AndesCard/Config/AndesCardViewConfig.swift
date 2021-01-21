//
//  AndesCardViewConfig.swift
//  AndesUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation

/// used to define the ui of internal AndesCard views
internal struct AndesCardViewConfig {
    let backgroundColor: UIColor
    let pipeColor: UIColor
    let borderColor: UIColor?
    let padding: UInt
    let titlePadding: UInt
    let titleHeight: UInt
    let shadow: AndesCardShadowConfig?
    let hasCardAction: Bool

    let titleText: String?
    var linkText: String?
    let cardView: UIView

    init(backgroundColor: UIColor, pipeColor: UIColor, borderColor: UIColor?, padding: UInt, titlePadding: UInt, titleHeight: UInt, shadow: AndesCardShadowConfig?, hasCardAction: Bool, titleText: String?, linkText: String?, cardView: UIView) {
        self.backgroundColor = backgroundColor
        self.pipeColor = pipeColor
        self.borderColor = borderColor
        self.padding = padding
        self.titlePadding = titlePadding
        self.titleHeight = titleHeight
        self.shadow = shadow
        self.hasCardAction = hasCardAction
        self.titleText = titleText
        self.linkText = linkText
        self.cardView = cardView
    }

    init() {
        self.backgroundColor = .clear
        self.pipeColor = .clear
        self.borderColor = nil
        self.padding = 0
        self.titlePadding = 16
        self.titleHeight = 40
        self.shadow = nil
        self.hasCardAction = false
        self.titleText = nil
        self.linkText = nil
        self.cardView = UIView()
    }
}
