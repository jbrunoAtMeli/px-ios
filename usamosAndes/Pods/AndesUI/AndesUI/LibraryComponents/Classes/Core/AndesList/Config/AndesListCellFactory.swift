//
//  AndesListCellSizeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

class AndesListCellFactory {
    static func provide(withSize size: AndesListSize,
                        subTitleIsEmpty: Bool, thumbnail: AndesThumbnail? = nil) -> AndesListCellConfig {

        let cellSize = AndesListCellSizeFactory.provideSize(withSize: size, subTitleIsEmpty: subTitleIsEmpty, thumbnail: thumbnail)
        let cellType = AndesListCellTypeFactory.provideType(withthumbnail: thumbnail)

        return AndesListCellConfig(font: cellSize.font,
                                   fontDescription: cellSize.fontDescription,
                                   height: cellSize.height,
                                   paddingLeft: cellSize.paddingLeft,
                                   paddingRight: cellSize.paddingRight,
                                   paddingTop: cellSize.paddingTop,
                                   paddingBottom: cellSize.paddingBottom,
                                   descriptionHeight: cellSize.descriptionHeight,
                                   separatorHeight: cellSize.separatorHeight,
                                   titleHeight: cellSize.titleHeight,
                                   chevronSize: cellSize.chevronSize,
                                   thumbnailSize: cellSize.thumbnailSize,
                                   separatorThumbnailWidth: cellSize.separatorThumbnailWidth,
                                   paddingTopThumbnail: cellSize.paddingTopThumbnail,
                                   paddingBottomThumbnail: cellSize.paddingBottomThumbnail,
                                   separatorChevronWidth: cellSize.separatorChevronWidth,
                                   paddingTopChevron: cellSize.paddingTopChevron,
                                   paddingBottomChevron: cellSize.paddingBottomChevron,
                                   chevronImage: cellType.chevronImage,
                                   thumbnailLeft: cellType.thumbnailLeft)
    }
}
