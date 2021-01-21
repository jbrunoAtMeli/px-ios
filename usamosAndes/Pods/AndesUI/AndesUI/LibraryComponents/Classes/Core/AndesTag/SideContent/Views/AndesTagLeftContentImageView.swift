//
//  AndesTagLeftContentImageView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation

class AndesTagLeftContentImageView: UIView {
    private var image: UIImage?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(image: UIImage) {
        self.init()
        self.image = image
        setupView()
    }

    func setupView() {
        guard let image = self.image else {
            return
        }
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.pinToSuperview(top: 0, left: 0, bottom: 0, right: 0)
        self.drawBorder()
    }

    func drawBorder() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 12, y: 12), radius: CGFloat(11.5), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.Andes.gray070.cgColor
        shapeLayer.lineWidth = 1

        self.layer.addSublayer(shapeLayer)
    }
}
