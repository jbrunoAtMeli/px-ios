//
//  AndesListCellSizeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

class AndesListCellSizeFactory {
    static func provideSize(withSize size: AndesListSize,
                        subTitleIsEmpty: Bool, thumbnail: AndesThumbnail? = nil) -> AndesListCellSizeProtocol {
        switch size {
        case .large:
            return AndesListCellLargeSize(subTitleIsEmpty: subTitleIsEmpty, thumbnail: thumbnail)
        case .small:
            return AndesListCellSmallSize(withThumbnail: thumbnail)
        case .medium:
            return AndesListCellMediumSize(subTitleIsEmpty: subTitleIsEmpty, thumbnail: thumbnail)
        }
    }
}
