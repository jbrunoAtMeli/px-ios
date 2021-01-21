//
//  AndesBadgeSizeLarge.swift
//  AndesUI
//

internal struct AndesBadgeSizeLarge: AndesBadgeSizeProtocol {
    public var font: UIFont = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 12)

    public var lineSpacing: CGFloat = 1

    public var height: CGFloat = 24

    public var borderRadius: CGFloat = 12

    public var verticalPadding: CGFloat = 7

    public var horizontalPadding: CGFloat = 8
}
