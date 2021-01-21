//
//  AndesTextFieldStateProtocol.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

internal protocol AndesTextFieldStateProtocol {
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }
    var borderDashed: Bool { get }

    var labelTextColor: UIColor { get }

    var helperColor: UIColor { get }
    var helperIconTintColor: UIColor? { get }
    var helperIconName: String? { get }
    var helperSemibold: Bool { get }

    var backgroundColor: UIColor { get }
    var inputTextColor: UIColor { get }
    var editingEnabled: Bool { get }

    var placeholderTextColor: UIColor { get }
}
