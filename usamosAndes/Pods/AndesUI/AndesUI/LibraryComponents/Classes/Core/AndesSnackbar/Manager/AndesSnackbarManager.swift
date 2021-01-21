//
//  AndesSnackbarManager.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/16/20.
//

import Foundation

/// This manager is in charge of show, dismiss and queue all the `AndesSnackbar`shown in the app
class AndesSnackbarManager {

    /// Shared Instance to implement Singleton Pattern
    static let shared = AndesSnackbarManager()

    /// This queue keeps the snackbars to be shown, one after another after each dismissing
    var snackbarsQueue: [AndesSnackbar] = []

    /// Adds the snackbar to the queue and shows it if there is no one presented
    func show(snackbar: AndesSnackbar) {
        if snackbar.context == nil {
            snackbar.context = UIApplication.getTopViewController()
        }

        snackbarsQueue.append(snackbar)
        if snackbarsQueue.count == 1 {
            showNextSnackbar()
        }
    }

    /// Shows the first snackbar in the `snackbarsQueue`
    func showNextSnackbar() {
        guard let snackbar = snackbarsQueue.first else { return }

        if let context = snackbar.context {
            addSnackbarToView(snackbar: snackbar, superView: context.view)
            showAnimated(snackbar: snackbar)
            setDismissTimer(snackbar: snackbar)
        } else {
            self.snackbarsQueue.removeFirst()
            self.showNextSnackbar()
        }
    }

    func addSnackbarToView(snackbar: AndesSnackbar, superView: UIView) {
        superView.addSubview(snackbar)

        var relativeToItem: Any = superView as Any
        var bottomInset: CGFloat = 0
        if #available(iOS 11.0, *) {
            relativeToItem = superView.safeAreaLayoutGuide as Any
            bottomInset = superView.safeAreaInsets.bottom
        }

        snackbar.translatesAutoresizingMaskIntoConstraints = false
        snackbar.layoutIfNeeded()

        snackbar.leftMarginConstraint = NSLayoutConstraint.init(
            item: snackbar, attribute: .leading, relatedBy: .equal,
            toItem: relativeToItem, attribute: .leading, multiplier: 1, constant: snackbar.snackbarMargin)

        snackbar.rightMarginConstraint = NSLayoutConstraint.init(
            item: snackbar, attribute: .trailing, relatedBy: .equal,
            toItem: relativeToItem, attribute: .trailing, multiplier: 1, constant: -snackbar.snackbarMargin)

        snackbar.bottomMarginConstraint = NSLayoutConstraint.init(
            item: snackbar, attribute: .bottom, relatedBy: .equal,
            toItem: relativeToItem, attribute: .bottom, multiplier: 1, constant: snackbar.frame.height + 50 + bottomInset)

        snackbar.leftMarginConstraint?.isActive = true
        snackbar.rightMarginConstraint?.isActive = true
        snackbar.bottomMarginConstraint?.isActive = true

        superView.layoutIfNeeded()

        snackbar.updateButtonsLayout()
    }

    func showAnimated(snackbar: AndesSnackbar) {
        guard let superview = snackbar.superview else {
            return
        }

        snackbar.bottomMarginConstraint?.constant = -snackbar.snackbarMargin
        UIView.animate(withDuration: 0.3) {
            superview.layoutIfNeeded()
        }

        // Accessibility announcement.
        if UIAccessibility.isVoiceOverRunning {
          UIAccessibility.post(notification: .announcement, argument: snackbar.text)
        }
    }

    func setDismissTimer(snackbar: AndesSnackbar) {
        let timer = Timer.init(timeInterval: (TimeInterval)(snackbar.duration.rawValue), target: self, selector: #selector(dismissSnackbar), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: .common)
        snackbar.timer = timer
    }

    @objc func dismissSnackbar() {
        guard let snackbar = snackbarsQueue.first else {
            return
        }

        DispatchQueue.main.async {
            self.dismissSnackbarAnimated(snackbar: snackbar)
        }
    }

    func dismissSnackbarAnimated(snackbar: AndesSnackbar) {
        guard let superview = snackbar.superview else {
            snackbar.timer?.invalidate()
            self.snackbarsQueue.removeFirst()
            self.showNextSnackbar()
            return
        }

        if let timer = snackbar.timer {
            timer.invalidate()
        }

        var bottomInset: CGFloat = 0
        if #available(iOS 11.0, *) {
            bottomInset = superview.safeAreaInsets.bottom
        }

        snackbar.bottomMarginConstraint?.constant = snackbar.frame.height + bottomInset

        UIView.animate(withDuration: 0.3, animations: {
            superview.layoutIfNeeded()
        }) { _ in
            snackbar.removeFromSuperview()
            self.snackbarsQueue.removeFirst()
            self.showNextSnackbar()
        }
    }
}
