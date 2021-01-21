//
//  AndesBottomSheetSizeManager.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import Foundation

class AndesBottomSheetSizeManager {
    var sheetViewSize: CGSize = .zero {
        didSet {
            arrangePossibleDimensions()
        }
    }

    var sheetContentSize: CGSize = .zero {
        didSet {
            arrangePossibleDimensions()
        }
    }

    var current: AndesBottomSheetSize

    var currentDimension: CGFloat {
        get {
            return dimension(for: current)
        }
    }

    private var possible: [AndesBottomSheetSize] = []

    init(sizes: [AndesBottomSheetSize]) {
        self.current = sizes.first ?? .intrinsic
        self.possible = sizes
        arrangePossibleDimensions()
    }

    func floor(height: CGFloat) -> AndesBottomSheetSize {
        return possible.reversed().first { 0...height ~= dimension(for: $0) } ?? min()
    }

    func ceil(height: CGFloat) -> AndesBottomSheetSize {
        return possible.first { dimension(for: $0) >= height } ?? max()
    }

    func min() -> AndesBottomSheetSize {
        return possible.first { dimension(for: $0) > 0 } ?? .intrinsic
    }

    func max() -> AndesBottomSheetSize {
        return possible.last { dimension(for: $0) > 0 } ?? .intrinsic
    }

    func dimension(for size: AndesBottomSheetSize) -> CGFloat {
        return calculateDimension(for: size)
    }

    private func arrangePossibleDimensions() {
        possible.sort { self.dimension(for: $0) < self.dimension(for: $1) }
    }

    private func calculateDimension(for size: AndesBottomSheetSize) -> CGFloat {
        switch size {
        case .fixed(let height):
            return height
        case .intrinsic:
            return sheetContentSize.height
        case .percent(let percent):
            return sheetViewSize.height * percent
        case .fixedFromTop(let margin):
            return sheetViewSize.height - margin
        case .min(let s1, let s2):
            return Swift.min(calculateDimension(for: s1), calculateDimension(for: s2))
        case .max(let s1, let s2):
            return Swift.max(calculateDimension(for: s1), calculateDimension(for: s2))
        }
    }
}
