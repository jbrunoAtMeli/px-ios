//
//  AndesBottomSheetTitleBarGradient.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 03/11/2020.
//

import UIKit

public class AndesBottomSheetTitleBarGradient: UIView {
    private let maxOffset: CGFloat

    private var previousScrollOffset: CGFloat = 0.0

    public init(maxOffset: CGFloat) {
        self.maxOffset = maxOffset
        super.init(frame: .zero)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        alpha = 0
        backgroundColor = .clear
    }

    public func update(with scrollOffset: CGFloat) {
        if 0.0 ... maxOffset ~= scrollOffset ||
            scrollOffset >= maxOffset && previousScrollOffset < maxOffset ||
            scrollOffset <= 0 && previousScrollOffset > 0 {
            let boundedOffset: CGFloat = min(max(scrollOffset, CGFloat(0)), CGFloat(maxOffset))
            UIView.animate(withDuration: 0.2) {
                self.alpha = boundedOffset / self.maxOffset
            }
        }

        previousScrollOffset = scrollOffset
    }

    public override func draw(_: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let colors = [UIColor.black.withAlphaComponent(0.12).cgColor, UIColor.clear.cgColor]

        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let colorLocations: [CGFloat] = [0.0, 0.6]

        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)!

        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.height)
        context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: [])
    }

    public override func point(inside _: CGPoint, with _: UIEvent?) -> Bool {
        return false
    }
}
