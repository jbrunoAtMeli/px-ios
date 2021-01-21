//
//  AndesTextFieldActionView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
class AndesTextFieldActionView: UIView {
    private var label: String?
    private var action: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    convenience init(label: String, action: @escaping () -> Void) {
        self.init()
        self.label = label
        self.action = action
        setUp()
    }

    func setUp() {
        guard let label = self.label else {
            return
        }
        let button = AndesButton(text: label, hierarchy: .transparent, size: .medium)
        self.addSubview(button)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        button.pinToSuperview(top: 0, left: 8, bottom: 0, right: 8)
    }

    @objc func tapped(_ btn: UIControl) {
        self.action?()
    }
}
