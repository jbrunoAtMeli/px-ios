//
//  AndesBottomSheetHeightManager.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import Foundation

class AndesBottomSheetHeightManager {
    weak var delegate: AndesBottomSheetHeightManagerDelegate?

    private var contentControllerViewHeightConstraint: NSLayoutConstraint

    init(constraint: NSLayoutConstraint, delegate: AndesBottomSheetHeightManagerDelegate) {
        self.contentControllerViewHeightConstraint = constraint
        self.delegate = delegate
    }

    func getHeight() -> CGFloat {
        return contentControllerViewHeightConstraint.constant
    }

    func setHeight(_ height: CGFloat) {
        contentControllerViewHeightConstraint.constant = height
        delegate?.heightDidChange(height)
    }

    func setActive(_ active: Bool) {
        contentControllerViewHeightConstraint.isActive = active
    }
}
