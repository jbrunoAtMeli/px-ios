//
//  AndesBadgeSizeSmall.swift
//  AndesUI
//

internal struct AndesBadgeSizeSmall: AndesBadgeSizeProtocol {
    public var font: UIFont = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 11)

    public var lineSpacing: CGFloat = 0.91

    public var height: CGFloat = 16

    public var borderRadius: CGFloat = 8

    public var verticalPadding: CGFloat = 3

    public var horizontalPadding: CGFloat = 6
}
