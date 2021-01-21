//
//  AndesThumbnailSize40.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//

import Foundation

internal struct AndesThumbnailSize40: AndesThumbnailSizeProtocol {

	var size: CGFloat
	var cornerRadius: CGFloat
	var borderWidth: CGFloat = 1.0
	var iconSize: CGFloat

	init(type: AndesThumbnailTypeProtocol) {
		size = 40
		cornerRadius = type.circular ? size/2 : 4.0
		iconSize = 24
	}
}
