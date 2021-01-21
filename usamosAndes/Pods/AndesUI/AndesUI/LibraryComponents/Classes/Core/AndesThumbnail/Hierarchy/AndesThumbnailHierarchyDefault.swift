//
//  AndesThumbnailHierarchyDefault.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

import Foundation

struct AndesThumbnailHierarchyDefault: AndesThumbnailHierarchyProtocol {
	var backgroundColor: UIColor
	var iconColor: UIColor?
	var borderColor: UIColor?
	var overlayColor: UIColor?

	init(type: AndesThumbnailTypeProtocol, status: AndesThumbnailState) {

		self.backgroundColor = .white
		self.borderColor = type.borderColor

		if status == .enabled {
			self.iconColor = UIColor.Andes.gray800
		} else {
			self.overlayColor =  UIColor.white.withAlphaComponent(0.6)
			self.iconColor = UIColor.Andes.gray250
		}
	}
}
