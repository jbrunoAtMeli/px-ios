//
//  AndesThumbnailAbstractView.swift
//  AndesUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

import Foundation

internal class AndesThumbnailAbstractView: UIView, AndesThumbnailView {

	var config: AndesThumbnailViewConfig
	private var fallbackImageView: UIImageView!

	required init?(coder: NSCoder) {
		config = AndesThumbnailViewConfig()
		super.init(coder: coder)
		setup()
	}

	init(config: AndesThumbnailViewConfig) {
		self.config = config
		super.init(frame: .zero)
		setup()
	}

	func setup() {
		self.frame = CGRect(x: 0, y: 0, width: config.size, height: config.size)
		backgroundColor = config.backgroundColor
		self.clipsToBounds = true
		thumbnailShape()
		drawImage()
	}

	func update(withConfig config: AndesThumbnailViewConfig) {
		self.config = config
		setup()
	}

	func thumbnailShape() {
		self.layer.cornerRadius = config.cornerRadius
		guard let borderColor = config.borderColor else {
			self.layer.borderWidth = 0.0
			return
		}
		self.layer.borderColor = borderColor.cgColor
		self.layer.borderWidth = 1.0

	}

	func drawImage() {
		fatalError("This should be overriden by a subclass")
	}
}
