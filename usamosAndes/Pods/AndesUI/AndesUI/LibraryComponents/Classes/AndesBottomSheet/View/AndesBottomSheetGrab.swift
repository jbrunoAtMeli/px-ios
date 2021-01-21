//
//  AndesBottomSheetGrab.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import UIKit

private enum Constants {
    static let height: CGFloat = 4.0
    static let width: CGFloat = 32.0
    static let backgroundColor = UIColor.Andes.white
    static let color: UIColor = UIColor.Andes.gray250
    static let inset: CGFloat = 10.0
    static let radius: CGFloat = 2.0
}

class AndesBottomSheetGrab: UIView {
    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = Constants.backgroundColor

        let grab = UIView()
        grab.translatesAutoresizingMaskIntoConstraints = false
        grab.backgroundColor = Constants.color
        grab.setCornerRadius(cornerRadius: Constants.radius, roundedCorners: [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        addSubview(grab)

        NSLayoutConstraint.activate([
            grab.heightAnchor.constraint(equalToConstant: Constants.height),
            grab.widthAnchor.constraint(equalToConstant: Constants.width),
            grab.centerYAnchor.constraint(equalTo: centerYAnchor),
            grab.centerXAnchor.constraint(equalTo: centerXAnchor),
            grab.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: Constants.inset),
            grab.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -Constants.inset),
            heightAnchor.constraint(equalToConstant: Constants.height + Constants.inset * 2)
        ])
    }
}
