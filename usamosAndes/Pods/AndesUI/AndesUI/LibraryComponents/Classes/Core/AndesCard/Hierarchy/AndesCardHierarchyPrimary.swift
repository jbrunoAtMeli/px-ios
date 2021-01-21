//
//  AndesCardHierarchyPrimary.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

struct AndesCardHierarchyPrimary: AndesCardHierarchyProtocol {
    let backgroundColor: UIColor
    let cardShadow: AndesCardShadowConfig?
    let borderColor: UIColor?
    let pipeColor: UIColor

    init(style: AndesCardStyleProtocol, type: AndesCardTypeProtocol) {
        backgroundColor = .white
        cardShadow = style.shadow
        borderColor = style.borderColor
        pipeColor = type.pipeColor
    }
}
