//
//  AndesButtonAbstractView.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 AndesButtonAbstractView is an abstract class that includes the functionality for the button to be drawn by a AndesButtonSizeProtocol and a AndesButtonStyleProtocol
 */
internal class AndesButtonAbstractView: UIControl, AndesButtonView {

    internal var config: AndesButtonViewConfig
    internal var backgroundLayer: CALayer

    @IBOutlet var buttonView: UIView!
    @IBOutlet var label: UILabel!

    override public var frame: CGRect {
        didSet {
               buttonView?.frame = frame
           }
    }

    internal init(config: AndesButtonViewConfig) {
        self.config = config
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesButtonViewConfigFactory.provide(hierarchy: .loud, size: .large, text: "Label", icon: nil)
        self.backgroundLayer = CALayer()
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        loadNib()

        backgroundLayer = buttonView.layer
        addSubview(buttonView)

        setupSize()
        setupStyle()
        setText(config.text)
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    internal func setupStyle() {
        backgroundLayer.backgroundColor = config.backgroundColor
        label.textColor = config.textColor
    }

    internal func setupSize() {
        backgroundLayer.cornerRadius = config.cornerRadius
        label.font = config.font
    }

    func enable() {
        setupStyle()
    }

    func disable() {
        backgroundLayer.backgroundColor = config.disableColor
        label.textColor = config.textDisableColor
    }

    func touchUp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundLayer.backgroundColor = self.config.backgroundColor
        }, completion: nil)
    }

    func touchDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundLayer.backgroundColor = self.config.pressedColor
        }, completion: nil)
    }

    func setText(_ text: String) {
        let attributedString = NSMutableAttributedString.init(string: text)
        let strRange = NSRange(location: 0, length: (text as NSString).length)
        attributedString.addAttribute(.paragraphStyle, value: AndesButtonHelper.provideParagraphStyle(), range: strRange)

        for attr in config.textAttributes {
            attributedString.addAttribute(attr.key, value: attr.value, range: strRange)
        }
        label.attributedText = attributedString
    }
}

internal class AndesButtonHelper {

    public static func provideParagraphStyle() -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byTruncatingTail

        return paragraphStyle
    }
}
