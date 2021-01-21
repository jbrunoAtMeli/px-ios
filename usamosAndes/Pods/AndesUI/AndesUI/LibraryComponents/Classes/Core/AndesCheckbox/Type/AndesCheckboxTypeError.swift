//
//  AndesCheckboxTypeError.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
// Handle checkbox error type
class AndesCheckboxTypeError: AndesCheckboxTypeProtocol {
    var borderColor: UIColor? = UIColor.Andes.red500
    var borderSize: CGFloat? = 2
    var textColor: UIColor = UIColor.Andes.gray800
    var backgroundColor: UIColor = UIColor.Andes.white
    var iconColor: UIColor?
    var cornerRadius: CGFloat = 3
}
