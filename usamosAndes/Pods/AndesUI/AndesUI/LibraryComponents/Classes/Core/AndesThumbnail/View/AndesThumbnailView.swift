//
//  AndesThumbnailView.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 01/07/2020.
//

import Foundation

internal protocol AndesThumbnailView: UIView {
	func update(withConfig config: AndesThumbnailViewConfig)
}
