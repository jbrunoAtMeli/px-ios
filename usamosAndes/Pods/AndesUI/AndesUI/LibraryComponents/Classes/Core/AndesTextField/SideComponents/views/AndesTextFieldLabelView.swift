//
//  AndesTextFieldLabelView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation
class AndesTextFieldLabelView: UIView {
    private var text: String?
    private var style: AndesFontStyle?
    private static let smallMargin: CGFloat = 8

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(text: String, style: AndesFontStyle, forceLeftPadding leftPadding: CGFloat = AndesTextFieldLabelView.smallMargin, forceRightPadding rightPadding: CGFloat = AndesTextFieldLabelView.smallMargin) {
        self.init()

        self.text = text
        self.style = style
        setUp(leftPadding: leftPadding, rightPadding: rightPadding)
    }

    func setUp(leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let text = self.text, let style = self.style else {
            return
        }

        let label = UILabel()
        label.text = text
        label.setAndesStyle(style: style)
        label.sizeToFit()
        self.addSubview(label)
        label.pinToSuperview(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
    }
}
