//
//  AndesBottomSheetViewControllerTransitioningConformance.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 04/11/2020.
//

import Foundation

class AndesBottomSheetViewControllerTransitioningConformance: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AndesBottomSheetPresentingTransitionAnimation()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AndesBottomSheetDismissingTransitionAnimation()
    }
}
