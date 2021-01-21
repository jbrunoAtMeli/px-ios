//
//  AndesMessageTypeSuccess.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeSuccess: AndesMessageTypeProtocol {
    var primaryColor: UIColor = UIColor.Andes.green500
    var secondaryColor: UIColor = UIColor.Andes.green600
    var primaryButtonPressedColor: UIColor = UIColor.Andes.green800
    var secondaryButtonPressedColor: UIColor = UIColor.Andes.green700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = AndesIcons.feedbackSuccess16
}
