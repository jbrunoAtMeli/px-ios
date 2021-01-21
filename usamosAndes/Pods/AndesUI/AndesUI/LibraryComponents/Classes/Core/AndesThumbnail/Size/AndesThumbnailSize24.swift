//
//  AndesThumbnailSize24.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//

internal struct AndesThumbnailSize24: AndesThumbnailSizeProtocol {

	var size: CGFloat
	var cornerRadius: CGFloat
	var borderWidth: CGFloat = 1.0
	var iconSize: CGFloat

	init(type: AndesThumbnailTypeProtocol) {
		size = 24
		cornerRadius = type.circular ? size/2 : 3.0
		iconSize = 16
	}
}
