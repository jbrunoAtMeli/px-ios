//
//  AndesThumbnailTypeIcon.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 30/06/2020.
//

import Foundation

class AndesThumbnailTypeIcon: AndesThumbnailTypeProtocol {

	var accentColor: UIColor?
	var borderColor: UIColor?
	var circular: Bool = true

	init(accentColor: UIColor?) {
		self.accentColor = accentColor
		self.borderColor = UIColor.Andes.gray070
	}
}
