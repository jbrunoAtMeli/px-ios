//
//  AndesThumbnailTypeFactory.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 30/06/2020.
//

import Foundation

class AndesThumbnailTypeFactory {
	static func provide(_ type: AndesThumbnailType, accentColor: UIColor?) -> AndesThumbnailTypeProtocol {
		switch type {
		case .icon:
			return AndesThumbnailTypeIcon(accentColor: accentColor)
		case .imageCircle:
			return AndesThumbnailTypeImageCircle()
		case .imageSquare:
			return AndesThumbnailTypeImageSquare()
		}
	}
}
