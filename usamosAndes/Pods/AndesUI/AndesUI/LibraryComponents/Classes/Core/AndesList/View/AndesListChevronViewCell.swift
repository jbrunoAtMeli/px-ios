//
//  AndesListChevronViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 26/10/20.
//

import UIKit

class AndesListChevronViewCell: AndesListCell {

    @IBOutlet weak var chevronImg: UIImageView!
    @IBOutlet weak var chevronWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var chevronHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var spaceChevronWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopChevronConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomChevronConstraint: NSLayoutConstraint!

    internal func display(indexPath: IndexPath, customCell: AndesListCell, separatorStyle: AndesSeparatorStyle) {
        setup(customCell: customCell, separatorStyle: separatorStyle)
        if let chevronSize = customCell.chevronSize {
            AndesIconsProvider.loadIcon(name: customCell.chevron ?? "", placeItInto: self.chevronImg)
            self.chevronWidthConstraint.constant = chevronSize
            self.chevronHeightConstraint.constant = chevronSize
            self.chevronImg.tintColor = UIColor.Andes.gray450
            self.paddingTopChevronConstraint.constant = customCell.paddingTopChevron ?? 0
            self.paddingBottomChevronConstraint.constant = customCell.paddingBottomChevron ?? 0
            self.spaceChevronWidthConstraint.constant = customCell.separatorChevronWidth ?? 0
        }
    }

}
