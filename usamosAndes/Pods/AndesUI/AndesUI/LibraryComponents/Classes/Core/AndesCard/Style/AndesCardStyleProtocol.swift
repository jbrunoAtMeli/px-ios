//
//  AndesCardStyleProtocol.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal protocol AndesCardStyleProtocol {
    var shadow: AndesCardShadowConfig? { get }
    var borderColor: UIColor? { get }
}
