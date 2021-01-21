//
//  AndesTextFieldClearView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import UIKit
internal class AndesTextFieldClearView: UIView {
    private var clearHandler: (() -> Void)?
    private var iconColor: UIColor?
    private var iconName: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(iconColor: UIColor, iconName: String, clearHandler: @escaping () -> Void) {
        self.init()

        self.iconColor = iconColor
        self.iconName = iconName
        self.clearHandler = clearHandler
        setUp()
    }

    func setUp() {
        guard let iconName = self.iconName, let iconColor = self.iconColor else {
            return
        }

        let btn = UIButton()
        AndesIconsProvider.loadIcon(name: iconName) {
            btn.setImage($0, for: .normal)
        }

        btn.accessibilityLabel = "Borrar texto".localized()

        btn.tintColor = iconColor
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(self.executeCallback), for: .touchUpInside)
        btn.pinToSuperview(top: 0, left: 8, bottom: 0, right: 8)
    }

    @objc func executeCallback() {
        clearHandler?()
    }
}
