//
//  AndesMessageTypeError.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeError: AndesMessageTypeProtocol {
    var primaryColor: UIColor = UIColor.Andes.red500
    var secondaryColor: UIColor = UIColor.Andes.red600
    var primaryButtonPressedColor: UIColor = UIColor.Andes.red800
    var secondaryButtonPressedColor: UIColor = UIColor.Andes.red700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = AndesIcons.feedbackError16
}
