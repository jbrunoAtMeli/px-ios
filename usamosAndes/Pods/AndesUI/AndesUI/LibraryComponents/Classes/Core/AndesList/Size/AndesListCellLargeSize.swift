//
//  AndesListCellLargeSize.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

struct AndesListCellLargeSize: AndesListCellSizeProtocol {
    var font = AndesFontStyle(textColor: UIColor.Andes.gray800,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyL),
                              lineSpacing: 5)
    var fontDescription = AndesFontStyle(textColor: UIColor.Andes.gray450,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM),
                              lineSpacing: 5)
    var height: CGFloat = 68
    var paddingLeft: CGFloat = 24
    var paddingRight: CGFloat = 24
    var paddingTop: CGFloat = 28
    var paddingBottom: CGFloat = 28
    var descriptionHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var titleHeight: CGFloat = 12
    var chevronSize: CGFloat? = 24
    var thumbnailSize: CGFloat? = 0
    var separatorThumbnailWidth: CGFloat? = 0
    var paddingTopThumbnail: CGFloat?
    var paddingBottomThumbnail: CGFloat?
    var paddingBottomChevron: CGFloat? = 26
    var paddingTopChevron: CGFloat? = 26
    var separatorChevronWidth: CGFloat? = 12

    init(subTitleIsEmpty: Bool, thumbnail: AndesThumbnail? = nil) {
        if !subTitleIsEmpty {
            height = 96
            paddingBottom = 29
            descriptionHeight = 17
            separatorHeight = 15
        }
        if let thumbnail = thumbnail {
            switch thumbnail.type {
            case .icon:
                thumbnailSize = 24
                separatorThumbnailWidth = 16
                paddingTopThumbnail = 27
            case .imageCircle, .imageSquare:
                height = 96
                thumbnailSize = 56
                separatorThumbnailWidth = 16
                paddingTopThumbnail = 24
                paddingBottomThumbnail = 24
                paddingTopChevron = 40
                paddingBottomChevron = 40
            }
        }
    }

}
