//
//  AndesMessageTypeWarning.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeWarning: AndesMessageTypeProtocol {
    var primaryColor: UIColor = UIColor.Andes.orange500
    var secondaryColor: UIColor = UIColor.Andes.orange600
    var primaryButtonPressedColor: UIColor = UIColor.Andes.orange800
    var secondaryButtonPressedColor: UIColor = UIColor.Andes.orange700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = AndesIcons.feedbackWarning16
}
