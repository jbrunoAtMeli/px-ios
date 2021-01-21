//
//  AndesCardHierarchySecondary.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

struct AndesCardHierarchySecondary: AndesCardHierarchyProtocol {
    let backgroundColor: UIColor
    let cardShadow: AndesCardShadowConfig?
    let borderColor: UIColor?
    let pipeColor: UIColor

    init() {
        self.backgroundColor = UIColor.Andes.graySolid040
        self.cardShadow = nil
        self.borderColor = nil
        self.pipeColor = AndesCardTypeNone().pipeColor
    }
}
