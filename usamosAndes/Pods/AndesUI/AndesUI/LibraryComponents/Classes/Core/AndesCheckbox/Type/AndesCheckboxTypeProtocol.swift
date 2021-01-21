//
//  AndesCheckboxTypeProtocol.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
internal protocol AndesCheckboxTypeProtocol {
    var borderColor: UIColor? { get }
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var iconColor: UIColor? { get }
    var cornerRadius: CGFloat { get }
    var borderSize: CGFloat? { get }
}
