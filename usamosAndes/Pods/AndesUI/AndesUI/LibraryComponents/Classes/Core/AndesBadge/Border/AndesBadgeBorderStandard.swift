//
//  AndesBadgeBorderStandard.swift
//  AndesUI
//

internal struct AndesBadgeBorderStandard: AndesBadgeBorderProtocol {
    public var corners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
}
