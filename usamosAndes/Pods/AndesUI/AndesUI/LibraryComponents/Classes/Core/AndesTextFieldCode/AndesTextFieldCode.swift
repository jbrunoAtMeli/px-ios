//
//  AndesTextFieldCode.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

@objc public class AndesTextFieldCode: UIView {

    var contentView: AndesTextFieldCodeView!

    /// Text for the label of the AndesTextFieldCode.
    @IBInspectable public var label: String? {
        didSet {
            updateContentView()
        }
    }

    /// Text for the helpLabel of the AndesTextFieldCode.
    @IBInspectable public var helpLabel: String? {
        didSet {
            updateContentView()
        }
    }

    /// The style of an AndesTextFieldCode defines the amount of input boxes and how they are grouped.
    @objc public var style: AndesTextFieldCodeStyle = .THREESOME {
        didSet {
            reDrawContentViewIfNeededThenUpdate()
        }
    }

    /// The state of an AndesTextFieldCode defines its behaviours and colours.
    @objc public var state: AndesTextFieldCodeState = .IDLE {
        didSet {
            updateContentView()
        }
    }

    /// The text of an AndesTextFieldCode defines the whole text entered taken from all input boxes.
    @IBInspectable public var text: String {
        get { return contentView.text }
        set { contentView.setText(newValue) }
    }

    @objc public weak var delegate: AndesTextFieldCodeDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(label: String?, helpLabel: String?, style: AndesTextFieldCodeStyle, state: AndesTextFieldCodeState) {
        self.label = label
        self.helpLabel = helpLabel
        self.style = style
        self.state = state
        super.init(frame: .zero)
        setup()
    }
}

// MARK: Publics
extension AndesTextFieldCode {
    /// Set focus on the component.
    @objc open func setFocus() {
        contentView.setFocus()
    }

    /// Remove focus from the component.
    @objc open func removeFocus() {
        contentView.removeFocus()
    }
}

// MARK: Privates
private extension AndesTextFieldCode {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        drawContentView(with: provideView())
    }

    func drawContentView(with newView: AndesTextFieldCodeView) {
        contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    /// Should return a view depending on which AndesTextfieldCode variant is selected.
    func provideView() -> AndesTextFieldCodeView {
        let config = AndesTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        switch config.style {
        case .THREESOME:
            return AndesTextFieldCodeThreesome(config: config)
        case .FOURSOME:
            return AndesTextFieldCodeFoursome(config: config)
        case .THREE_BY_THREE:
            return AndesTextFieldCodeThreeByThree(config: config)
        }
    }

    func updateContentView() {
        let config = AndesTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        contentView?.update(withConfig: config)
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered.
    func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            let oldText = contentView.text
            contentView.removeFromSuperview()
            drawContentView(with: newView)
            if !oldText.isEmpty { contentView.setText(oldText) }
        }
        updateContentView()
    }
}

// MARK: AndesTextFieldCodeDelegate
extension AndesTextFieldCode: AndesTextFieldCodeDelegate {
    public func textDidChange(_ text: String) {
        delegate?.textDidChange?(text)
    }

    public func textDidComplete(_ isComplete: Bool) {
        delegate?.textDidComplete?(isComplete)
    }
}

// MARK: - IB Enum Adapters
public extension AndesTextFieldCode {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
    @IBInspectable var ibState: String {
        get {
            return ""
        }
        set(val) {
            state = AndesTextFieldCodeState.checkValidEnum(property: "IB State", key: val)
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'style' instead.")
    @IBInspectable var ibStyle: String {
        get {
            return ""
        }
        set(val) {
            style = AndesTextFieldCodeStyle.checkValidEnum(property: "IB Style", key: val)
        }
    }
}
