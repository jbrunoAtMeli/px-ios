//
//  AndesThumbnailSizeProtocol.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//

import Foundation

/**
The AndesThumbnailSizeProtocol provides the differents attributes that define the size of the Thumbnail, these can be constants or calculated
*/

internal protocol AndesThumbnailSizeProtocol {

	var size: CGFloat { get }
	var cornerRadius: CGFloat { get }
	var borderWidth: CGFloat { get }
	var iconSize: CGFloat { get }
}
