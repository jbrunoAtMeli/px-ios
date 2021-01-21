//
//  AndesBottomSheetTransitionAnimation.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import Foundation

class AndesBottomSheetPresentingTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    private static let duration = TimeInterval(0.2)

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AndesBottomSheetPresentingTransitionAnimation.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard let toViewController = transitionContext.viewController(forKey: .to) as? AndesBottomSheetViewController,
            let fromViewController = transitionContext.viewController(forKey: .from),
            let contentView = toViewController.view.subviews.last else { return }

        fromViewController.beginAppearanceTransition(false, animated: true)
        toViewController.beginAppearanceTransition(true, animated: true)

        containerView.addSubview(toViewController.view)

        toViewController.dimmerView.alpha = 0.0
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.bounds.height)

        UIView.animate(withDuration: AndesBottomSheetPresentingTransitionAnimation.duration,
                        delay: 0.0,
                        options: [.curveEaseOut],
                        animations: {
            toViewController.dimmerView.alpha = 1.0
            contentView.transform = .identity
        }, completion: { _ in
            fromViewController.endAppearanceTransition()
            toViewController.endAppearanceTransition()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

class AndesBottomSheetDismissingTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    private static let duration = TimeInterval(0.2)

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AndesBottomSheetDismissingTransitionAnimation.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) as? AndesBottomSheetViewController,
            let contentView = fromViewController.view.subviews.last else { return }

        fromViewController.beginAppearanceTransition(false, animated: true)
        toViewController.beginAppearanceTransition(true, animated: true)

        containerView.addSubview(fromViewController.view)

        UIView.animate(withDuration: AndesBottomSheetDismissingTransitionAnimation.duration,
                       delay: 0.0,
                       options: [.curveEaseIn],
                       animations: {
            fromViewController.dimmerView.alpha = 0.0
            contentView.transform = CGAffineTransform(translationX: 0, y: contentView.bounds.height)
        }) { _ in
            fromViewController.endAppearanceTransition()
            toViewController.endAppearanceTransition()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
