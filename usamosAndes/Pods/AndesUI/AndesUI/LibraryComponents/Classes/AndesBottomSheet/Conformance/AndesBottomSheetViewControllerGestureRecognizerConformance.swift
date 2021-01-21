//
//  AndesBottomSheetViewControllerGestureRecognizerConformance.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 04/11/2020.
//

import Foundation

class AndesBottomSheetViewControllerGestureRecognizerConformance: NSObject, UIGestureRecognizerDelegate {
    weak var scrollView: UIScrollView?

    private weak var sizeManager: AndesBottomSheetSizeManager?

    init(sizeManager: AndesBottomSheetSizeManager?) {
        self.sizeManager = sizeManager
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let gestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer,
            let view = gestureRecognizer.view,
            let sizeManager = sizeManager else { return true }

        guard let scrollView = self.scrollView, scrollView.window != nil else { return true }

        let point = gestureRecognizer.location(in: view)
        let pointInChildScrollView = view.convert(point, to: scrollView).y - scrollView.contentOffset.y

        guard pointInChildScrollView > 0, pointInChildScrollView < scrollView.bounds.height else { return true }

        let topInset = scrollView.contentInset.top
        let velocity = gestureRecognizer.velocity(in: gestureRecognizer.view?.superview)

        guard abs(velocity.y) > abs(velocity.x), scrollView.contentOffset.y <= -topInset else { return false }

        if velocity.y < 0 {
            let containerHeight = sizeManager.currentDimension
            return sizeManager.dimension(for: sizeManager.max()) > containerHeight && containerHeight < sizeManager.dimension(for: .percent(1.0))
        }

        return true
    }
}
