//
//  AndesThumbnailHierarchyFactory.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

import Foundation

internal class AndesThumbnailHierarchyFactory {
	static func provide(_ hierarchy: AndesThumbnailHierarchy, forType type: AndesThumbnailTypeProtocol, status: AndesThumbnailState) -> AndesThumbnailHierarchyProtocol {

		switch hierarchy {
		case .defaultHierarchy:
			return AndesThumbnailHierarchyDefault(type: type, status: status)
		case .quiet:
			return AndesThumbnailHierarchyQuiet(type: type, status: status)
		case .loud:
			return AndesThumbnailHierarchyLoud(type: type, status: status)
		}
	}
}
