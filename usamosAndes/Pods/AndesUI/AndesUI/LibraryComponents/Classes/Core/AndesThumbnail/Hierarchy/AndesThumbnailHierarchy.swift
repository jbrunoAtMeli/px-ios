//
//  AndesThumbnailHierarchy.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

/**
The AndesThumbnailHierarchy contains the differents hierarchies that a thumbnail supports
*/
@objc public enum AndesThumbnailHierarchy: Int, AndesEnumStringConvertible {
	case defaultHierarchy
	case loud
	case quiet

	public static func keyFor(_ value: AndesThumbnailHierarchy) -> String {
		switch value {
		case .loud: return "LOUD"
		case .quiet: return "QUIET"
		case .defaultHierarchy: return "DEFAULT"
		}
	}
}
