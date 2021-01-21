//
//  AndesBadgeHierarchyLoud.swift
//  AndesUI
//

import Foundation

struct AndesBadgeHierarchyLoud: AndesBadgeHierarchyProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor

    init(type: AndesBadgeTypeProtocol) {
        backgroundColor = type.primaryColor
        textColor = AndesStyleSheetManager.styleSheet.textColorWhite
    }
}
