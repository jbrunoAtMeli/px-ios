//
//  AndesBadgeHierarchyQuiet.swift
//  AndesUI
//

import Foundation

struct AndesBadgeHierarchyQuiet: AndesBadgeHierarchyProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor

    init(type: AndesBadgeTypeProtocol) {
        backgroundColor = type.secondaryColor
        textColor = type.primaryColor
    }
}
