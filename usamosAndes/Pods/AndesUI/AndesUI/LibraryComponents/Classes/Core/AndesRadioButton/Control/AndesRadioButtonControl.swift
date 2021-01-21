//
//  AndesRadioButtonControl.swift
//  AndesUI
//
//  Created by Samuel Sainz on 7/2/20.
//

/// Radio Button Control component
class AndesRadioButtonControl: UIView {

    /// Set the RadioButton filled or not with this Bool
    var filled: Bool = false {
        didSet {
            updateInternalCircle()
        }
    }

    /// Internal property to set the radio button color
    var color: UIColor {
        didSet {
            borderCircle.strokeColor = color.cgColor
            if filled {
                internalCircle.fillColor = color.cgColor
            }
        }
    }

    /// Callback to be invoked when RadioButton is tapped
    var tapCallback: ((AndesRadioButtonControl) -> Void)?

    /// Internal constant to set the RadioButton diameter
    private let diameter: CGFloat = 16.0

    /// Outer line width
    private let lineWidth: CGFloat = 2.0

    /// Radio button internal subview
    private var buttonView = UIView()

    /// Outer circle shape
    private var borderCircle = CAShapeLayer()

    /// The shape for the internal filled circle, built lazy to avoid building it when the RadioButton is never filled
    private lazy var internalCircle: CAShapeLayer = { self.buildInternalCircle() }()

    init(frame: CGRect? = .zero, filled: Bool, color: UIColor) {
        self.filled = filled
        self.color = color
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        initRadioButton()
    }

    init() {
        self.filled = false
        self.color = UIColor.blue
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        initRadioButton()
    }

    required init?(coder: NSCoder) {
        self.filled = false
        self.color = AndesStyleSheetManager.styleSheet.accentColor
        super.init(coder: coder)
        self.translatesAutoresizingMaskIntoConstraints = false
        initRadioButton()
    }

    func initRadioButton() {
        initButtonView()
        initBorderCircle()

        if filled {
            buttonView.layer.addSublayer(internalCircle)
        }

        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapRadioButtonControl)))
    }

    func initButtonView() {
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.widthAnchor.constraint(equalToConstant: diameter).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        self.addSubview(buttonView)

        self.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
    }

    func initBorderCircle() {
        let center: CGFloat = diameter / 2.0
        let radius = (diameter - lineWidth) / 2.0

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: center, y: center), radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        borderCircle.path = circlePath.cgPath
        borderCircle.fillColor = UIColor.clear.cgColor
        borderCircle.strokeColor = color.cgColor
        borderCircle.lineWidth = lineWidth

        buttonView.layer.addSublayer(borderCircle)
    }

    func buildInternalCircle() -> CAShapeLayer {
        let internalCircleLayer = CAShapeLayer()

        let center: CGFloat = diameter / 2.0
        let radius: CGFloat = (diameter / 2.0) - 4
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: center, y: center), radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)

        internalCircleLayer.path = circlePath.cgPath
        internalCircleLayer.fillColor = color.cgColor
        internalCircleLayer.lineWidth = 0

        return internalCircleLayer
    }

    private func updateInternalCircle() {
        if filled {
            buttonView.layer.addSublayer(internalCircle)
        } else {
            internalCircle.removeFromSuperlayer()
        }
    }

    @objc private func didTapRadioButtonControl() {
        guard let callback = tapCallback else {
            return
        }
        callback(self)
    }
}
