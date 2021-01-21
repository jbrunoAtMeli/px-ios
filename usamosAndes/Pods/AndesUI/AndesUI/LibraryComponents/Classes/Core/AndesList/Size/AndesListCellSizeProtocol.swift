//
//  AndesListCellSizeProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

protocol AndesListCellSizeProtocol {
    var font: AndesFontStyle { get }
    var fontDescription: AndesFontStyle { get }
    var height: CGFloat { get }
    var paddingLeft: CGFloat { get }
    var paddingRight: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var descriptionHeight: CGFloat { get }
    var separatorHeight: CGFloat { get }
    var titleHeight: CGFloat { get }
    var chevronSize: CGFloat? { get }
    var thumbnailSize: CGFloat? { get }
    var separatorThumbnailWidth: CGFloat? { get }
    var paddingTopThumbnail: CGFloat? { get }
    var paddingBottomThumbnail: CGFloat? { get }
    var separatorChevronWidth: CGFloat? { get }
    var paddingTopChevron: CGFloat? { get }
    var paddingBottomChevron: CGFloat? { get }
}
