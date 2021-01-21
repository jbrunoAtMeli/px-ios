//
//  AndesListCellType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 6/11/20.
//

import Foundation

struct AndesListCellType: AndesListCellTypeProtocol {
    var chevronImage: String = "andes_ui_chevron_right_24"
    var thumbnailLeft: UIImage?

    init(thumbnail: AndesThumbnail? = nil) {
        if let thumbnail = thumbnail {
            thumbnailLeft = thumbnail.image
        }
    }
}
