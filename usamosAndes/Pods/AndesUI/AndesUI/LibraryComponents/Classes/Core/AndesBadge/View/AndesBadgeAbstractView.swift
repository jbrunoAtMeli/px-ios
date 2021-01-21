//
//  AndesBadgeAbstractView.swift
//  AndesUI
//

import UIKit

class AndesBadgeAbstractView: UIView, AndesBadgeView {
    @IBOutlet weak var badgeView: UIView!

    var config: AndesBadgeViewConfig
    init(withConfig config: AndesBadgeViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesBadgeViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesBadgeViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(badgeView)
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: badgeView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: badgeView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: badgeView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: badgeView.bottomAnchor).isActive = true
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()

        self.clipsToBounds = true
        badgeView.clipsToBounds = true
    }

    /// Override this method on each Badge View to setup its unique components
    func updateView() {
        self.backgroundColor = config.backgroundColor
    }
}
