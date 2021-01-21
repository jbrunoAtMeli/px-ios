//
//  AndesThumbnailSizeFactory.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//

import Foundation

/**
The responsability of the factory is to provide the right size by providing the AndesButtonSize
*/
class AndesThumbnailSizeFactory {
	static func provide(_ size: AndesThumbnailSize, type: AndesThumbnailTypeProtocol) -> AndesThumbnailSizeProtocol {
		switch size {
		case .size24:
			return AndesThumbnailSize24(type: type)
		case .size32:
			return AndesThumbnailSize32(type: type)
		case .size40:
			return AndesThumbnailSize40(type: type)
		case .size48:
			return AndesThumbnailSize48(type: type)
		case .size56:
			return AndesThumbnailSize56(type: type)
		case .size64:
			return AndesThumbnailSize64(type: type)
		case .size72:
			return AndesThumbnailSize72(type: type)
		case .size80:
			return AndesThumbnailSize80(type: type)
		}
	}
}
