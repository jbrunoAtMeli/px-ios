//
//  AndesBottomSheetSize.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import Foundation

indirect enum AndesBottomSheetSize: Equatable, Hashable {
    case intrinsic
    case percent(CGFloat)
    case fixed(CGFloat)
    case fixedFromTop(CGFloat)
    case min(AndesBottomSheetSize, AndesBottomSheetSize)
    case max(AndesBottomSheetSize, AndesBottomSheetSize)
}
