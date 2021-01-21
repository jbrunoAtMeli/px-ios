//
//  AndesTagAbstractView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation

class AndesTagAbstractView: UIView, AndesTagViewProtocol {

    weak var delegate: AndesTagViewDelegate?

    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var rightButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!

    var config: AndesTagViewConfig

    init(withConfig config: AndesTagViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesTagViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesTagViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(tagView)
        tagView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: tagView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: tagView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: tagView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: tagView.bottomAnchor).isActive = true
    }

    func setup() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tap)
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()
        self.clipsToBounds = true
        tagView.clipsToBounds = true
    }

    /// Override this method on each Badge View to setup its unique components
    func updateView() {
        fatalError("This should be overriden by a subclass")
    }

    @IBAction func rightButtonTapped(_ sender: Any) {
        fatalError("This should be overriden by a subclass")
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        fatalError("This should be overriden by a subclass")
    }
}
