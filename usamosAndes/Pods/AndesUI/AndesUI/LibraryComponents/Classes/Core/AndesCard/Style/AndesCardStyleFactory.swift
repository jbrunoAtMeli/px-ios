//
//  AndesCardStyleFactory.swift
//  AndesUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class AndesCardStyleFactory {
    static func provide(_ style: AndesCardStyle) -> AndesCardStyleProtocol {
        switch style {
        case .elevated:
            return AndesCardStyleElevated()
        case .outline:
            return AndesCardStyleOutline()
        }
    }
}
