//
//  AndesMessageWithActionsView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/28/20.
//

import UIKit

class AndesMessageWithActionsView: AndesMessageAbstractView {
    @IBOutlet weak var primaryAction: AndesButton!
    @IBOutlet weak var secondaryAction: AndesButton!
    @IBOutlet weak var spacingBetweenBodyAndActions: NSLayoutConstraint!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesMessageWithActionsView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        primaryAction.size = .medium
        secondaryAction.size = .medium

        if let primaryConfig = config.primaryActionConfig {
            primaryAction.updateWithCustomConfig(primaryConfig)
            spacingBetweenBodyAndActions.constant = 16.0
        }

        if let sConfig = config.secondaryActionConfig {
            secondaryAction.isHidden = false
            secondaryAction.updateWithCustomConfig(sConfig)
        } else {
            secondaryAction.isHidden = true
        }

        if let linkConfig = config.linkActionConfig {
            primaryAction.updateWithCustomConfig(linkConfig)
            spacingBetweenBodyAndActions.constant = 8.0
        }
    }

    @IBAction func primaryButtonTapped(_ sender: Any) {
        self.delegate?.primaryBtnTouchUp()
    }

    @IBAction func secondaryButtonTapped(_ sender: Any) {
        self.delegate?.secondaryBtnTouchUp()
    }
}
