//
//  AndesTagSizeFactory.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/29/20.
//

import Foundation

class AndesTagSizeFactory {
    static func provide(_ type: AndesTagSize) -> AndesTagSizeProtocol {
        switch type {
        case .large:
            return AndesTagSizeLarge()
        case .small:
            return AndesTagSizeSmall()
        }
    }
}
