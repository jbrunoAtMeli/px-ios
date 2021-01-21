//
//  AndesBottomSheetTitleBar.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import UIKit

private enum Constants {
    static let font = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: AndesFontSize.titleS)
    static let backgroundColor = UIColor.Andes.white
    static let color = UIColor.Andes.gray800
    static let insets = UIEdgeInsets(top: 10, left: 24, bottom: 20, right: 24)
}

@objc
public class AndesBottomSheetTitleBar: UIView {
    @objc
    public var text: String? {
        get {
            return textLabel.text
        }
        set {
            textLabel.text = newValue
            setupHeightForText()
        }
    }

    @objc
    public var textAlignment: NSTextAlignment {
        get {
            return textLabel.textAlignment
        }
        set {
            textLabel.textAlignment = newValue
        }
    }

    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: AndesFontSize.titleS)
        textLabel.textColor = UIColor.Andes.gray800
        textLabel.numberOfLines = 1
        return textLabel
    }()

    private lazy var heightConstraint: NSLayoutConstraint = {
        return heightAnchor.constraint(equalToConstant: 0)
    }()

    @objc
    init() {
        super.init(frame: .zero)
        setup()
        setupHeightForText()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = Constants.backgroundColor
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)

        let bottomConstraint = textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.insets.bottom)
        bottomConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.insets.top),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.insets.left),
            bottomConstraint,
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.insets.right)
        ])
        textLabel.setContentHuggingPriority(.required, for: .vertical)
    }

    private func setupHeightForText() {
        heightConstraint.isActive = text == nil
    }
}
