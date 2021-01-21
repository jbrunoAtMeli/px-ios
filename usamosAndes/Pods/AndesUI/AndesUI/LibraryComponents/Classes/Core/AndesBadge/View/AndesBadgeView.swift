//
//  AndesBadgeView.swift
//  AndesUI
//

import Foundation

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesBadge
 */
internal protocol AndesBadgeView: UIView {
    func update(withConfig config: AndesBadgeViewConfig)
}
