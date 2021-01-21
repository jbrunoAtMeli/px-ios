//
//  AndesThumbnailTypeImageCircle.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 30/06/2020.
//

import Foundation

class AndesThumbnailTypeImageCircle: AndesThumbnailTypeProtocol {

	var accentColor: UIColor?
	var borderColor: UIColor?
	var circular: Bool = true

	init() {
		borderColor = UIColor.Andes.gray070
	}
}
