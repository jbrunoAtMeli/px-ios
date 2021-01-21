//
//  AndesTagLeftContentIconView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation

class AndesTagLeftContentIconView: UIView {

    private var icon: UIImage?
    private var iconColor: UIColor?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(backgroundColor: UIColor, icon: UIImage, iconColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.iconColor = iconColor
        setupView()
    }

    func setupView() {
        guard let icon = self.icon, let iconColor = self.iconColor else {
            return
        }
        let imageView = UIImageView(image: icon)
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = iconColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .center
        self.addSubview(imageView)
        imageView.pinToSuperview(top: 0, left: 0, bottom: 0, right: 0)
    }
}
