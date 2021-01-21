//
//  AndesThumbnailSize.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

/**
The AndesThumbnailSize contains the differents sizes that a Thumbnail supports
*/
@objc public enum AndesThumbnailSize: Int, AndesEnumStringConvertible {

	case size24
	case size32
	case size40
	case size48
	case size56
	case size64
	case size72
	case size80

	public static func keyFor(_ value: AndesThumbnailSize) -> String {
		switch value {
        case .size24: return "size_24"
        case .size32: return "size_32"
        case .size40: return "size_40"
        case .size48: return "size_48"
        case .size56: return "size_56"
        case .size64: return "size_64"
        case .size72: return "size_72"
        case .size80: return "size_80"
		}
	}

    public static func floatToAndesThumbnailSize(value: CGFloat) -> AndesThumbnailSize {
        return self.allCases.first { $0.toString().stringToFloat() == value } ?? .size40
    }
}
