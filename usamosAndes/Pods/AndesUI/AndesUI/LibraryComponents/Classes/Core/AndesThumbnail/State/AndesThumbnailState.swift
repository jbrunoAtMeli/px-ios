//
//  AndesThumbnailState.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

/**
The AndesThumbnailState contains the differents states that a thumbnail supports
*/
@objc public enum AndesThumbnailState: Int, AndesEnumStringConvertible {

	case enabled
	case disabled

	public static func keyFor(_ value: AndesThumbnailState) -> String {
		switch value {
		case .enabled: return "ENABLED"
		case .disabled: return "DISABLED"
		}
	}
}
