//
//  AndesThumbnailType.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

/**
The AndesThumbnailType contains the differents types that a thumbnail supports
*/
@objc public enum AndesThumbnailType: Int, AndesEnumStringConvertible {

	case icon
	case imageCircle
	case imageSquare

	public static func keyFor(_ value: AndesThumbnailType) -> String {
		switch value {
		case .icon: return "ICON"
		case .imageCircle: return "IMAGE_CIRCLE"
		case .imageSquare: return "IMAGE_SQUARE"
		}
	}
}
