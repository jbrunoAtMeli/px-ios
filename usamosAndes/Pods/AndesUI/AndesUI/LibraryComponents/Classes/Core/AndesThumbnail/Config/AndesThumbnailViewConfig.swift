//
//  AndesThumbnailViewConfig.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//

import Foundation

/**
The AndesThumbnailViewConfig contains the differents customizable attributes of the view
*/
internal struct AndesThumbnailViewConfig {

	var image: UIImage!
	var size: CGFloat = 24
	var iconSize: CGFloat = 0.0
	var cornerRadius: CGFloat = 3.0
	var borderColor: UIColor?
	var overlayColor: UIColor?
	var backgroundColor: UIColor = .white
	var iconColor: UIColor?
}
