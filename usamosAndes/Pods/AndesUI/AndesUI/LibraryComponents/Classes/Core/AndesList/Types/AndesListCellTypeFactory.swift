//
//  AndesListCellTypeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

class AndesListCellTypeFactory {
    static func provideType(withthumbnail thumbnail: AndesThumbnail? = nil) -> AndesListCellTypeProtocol {
        return AndesListCellType(thumbnail: thumbnail)
    }
}
