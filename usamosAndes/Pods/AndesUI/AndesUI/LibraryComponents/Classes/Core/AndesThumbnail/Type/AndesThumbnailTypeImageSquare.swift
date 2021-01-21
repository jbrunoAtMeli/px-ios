//
//  AndesThumbnailTypeImageSquare.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 30/06/2020.
//

import Foundation

class AndesThumbnailTypeImageSquare: AndesThumbnailTypeProtocol {

	var accentColor: UIColor?
	var borderColor: UIColor?
	var circular: Bool = false

	init() {
		borderColor = UIColor.Andes.gray070
	}
}
