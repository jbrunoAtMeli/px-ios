//
//  AndesTag.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/27/20.
//

import Foundation

@objc public class AndesTagSimple: UIView {

    internal var contentView: AndesTagSimpleView!

    /// Text shown by the Simple Tag
    @objc public var text: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Size for the Simple Tag
    @objc public var size: AndesTagSize = .small {
        didSet {
            self.updateContentView()
        }
    }

    /// Type indicates different color styles for different semantic pruposes
    @objc public var type: AndesTagType = .neutral {
        didSet {
            self.updateContentView()
        }
    }

    /// Set the Simple Tag left content. Available only for large size.
    @objc public var leftContent: AndesTagLeftContent? {
        didSet {
            self.updateContentView()
        }
    }

    /// If the tag is dismissible, a close button is shown in the right side
    @objc public var isDismissible: Bool = false {
        didSet {
            self.updateContentView()
        }
    }

    /// Callback invoked when dismiss button is tapped
    internal var didDismiss: ((AndesTagSimple) -> Void)?

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(text: String, size: AndesTagSize, type: AndesTagType, isDismissible: Bool) {
        super.init(frame: .zero)
        self.text = text
        self.size = size
        self.type = type
        self.isDismissible = isDismissible
        setup()
    }

    @objc public init(text: String, size: AndesTagSize, type: AndesTagType, isDismissible: Bool, leftContent: AndesTagLeftContent?) {
        super.init(frame: .zero)
        self.text = text
        self.size = size
        self.type = type
        self.isDismissible = isDismissible
        self.leftContent = leftContent
        setup()
    }

    /// Set dismiss callback to be invoked when dismiss button is pressed
    @objc public func setDidDismiss(callback: @escaping ((AndesTagSimple) -> Void)) {
        self.didDismiss = callback
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: AndesTagSimpleView) {
        self.contentView = newView
        self.contentView.delegate = self
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func updateContentView() {
        let config = AndesTagViewConfigFactory.provideInternalConfig(fromSimpleTag: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which Badge modifier is selected
    private func provideView() -> AndesTagSimpleView {
        let config = AndesTagViewConfigFactory.provideInternalConfig(fromSimpleTag: self)

        return AndesTagSimpleView(withConfig: config)
    }
}

extension AndesTagSimple: AndesTagViewDelegate {
    func didTapTagRightButton() {
        guard let callback = self.didDismiss else {
            return
        }
        callback(self)
    }

    func didTapTagView() {
        // Do nothing
    }
}
