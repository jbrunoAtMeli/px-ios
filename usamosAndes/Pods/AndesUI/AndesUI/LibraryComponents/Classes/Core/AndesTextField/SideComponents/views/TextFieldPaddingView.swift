//
//  TextFieldPaddingView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/24/20.
//

import UIKit

class TextFieldPaddingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(size: CGFloat) {
        self.init(frame: CGRect(x: 0, y: 0, width: size, height: 10))
    }
}
