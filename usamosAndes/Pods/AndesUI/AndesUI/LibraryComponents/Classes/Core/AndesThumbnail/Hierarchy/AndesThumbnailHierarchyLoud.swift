//
//  AndesThumbnailHierarchyLoud.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 30/06/2020.
//

import Foundation

struct AndesThumbnailHierarchyLoud: AndesThumbnailHierarchyProtocol {
	var backgroundColor: UIColor
	var iconColor: UIColor?
	var borderColor: UIColor?
	var overlayColor: UIColor?

	init(type: AndesThumbnailTypeProtocol, status: AndesThumbnailState) {

		guard let accentColor = type.accentColor else {
			fatalError("AndesThumbnail - AccentColor must be provider for Loud Hierarchy")
		}

		if status == .enabled {
			self.backgroundColor = accentColor
			self.iconColor = UIColor.white
		} else {
			self.backgroundColor = UIColor.Andes.gray100
			self.iconColor = UIColor.Andes.gray250
		}
	}
}
