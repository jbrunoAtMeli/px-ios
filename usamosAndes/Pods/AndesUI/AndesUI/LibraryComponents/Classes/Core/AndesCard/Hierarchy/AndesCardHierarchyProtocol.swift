//
//  AndesCardHierarchyProtocol.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal protocol AndesCardHierarchyProtocol {
    var backgroundColor: UIColor { get }
    var cardShadow: AndesCardShadowConfig? { get }
    var borderColor: UIColor? { get }
    var pipeColor: UIColor { get }
}
