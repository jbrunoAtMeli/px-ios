//
//  AndesDatePickerCell.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 10/11/20.
//

import UIKit

class AndesDatePickerCell: UICollectionViewCell {

    // MARK: - Attributes

    static let identifier = String(describing: AndesDatePickerCell.self)

    private lazy var accessibilityDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")

        return dateFormatter
    }()

    var day: AndesDayDatePicker? {
        didSet {
            guard let day = day else { return }
            numberLabel.text = day.number
            accessibilityLabel = accessibilityDateFormatter.string(from: day.date)
            updateSelectionStatus()
        }
    }

    // MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)

        isAccessibilityElement = true
        accessibilityTraits = .button

        contentView.addSubview(selectionBackgroundView)
        contentView.addSubview(numberLabel)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.deactivate(selectionBackgroundView.constraints)
        let size = CGFloat(32)
        NSLayoutConstraint.activate([
          numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
          numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

          selectionBackgroundView.centerYAnchor
            .constraint(equalTo: numberLabel.centerYAnchor),
          selectionBackgroundView.centerXAnchor
            .constraint(equalTo: numberLabel.centerXAnchor),
          selectionBackgroundView.widthAnchor.constraint(equalToConstant: size),
          selectionBackgroundView.heightAnchor
            .constraint(equalTo: selectionBackgroundView.widthAnchor)
        ])

        selectionBackgroundView.layer.cornerRadius = size / 2
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layoutSubviews()
    }

    // MARK: - UIComponents

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14.0)

        return label
    }()

    private lazy var selectionBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = UIColor.Andes.blueMP500

        return view
    }()

    // MARK: - Class methods

    func updateSelectionStatus() {
        guard let day = day else { return }
        day.selected ? applySelectedStyle() : applyDefaultStyle(isWithinDisplayedMonth: day.isCurrentMonth)
    }

    var isSmallScreenSize: Bool {
        let isCompact = traitCollection.horizontalSizeClass == .compact
        let smallWidth = UIScreen.main.bounds.width <= 350
        let widthGreaterThanHeight =
            UIScreen.main.bounds.width > UIScreen.main.bounds.height
        return isCompact && (smallWidth || widthGreaterThanHeight)
    }

    func applySelectedStyle() {
        accessibilityTraits.insert(.selected)
        accessibilityHint = nil
        numberLabel.textColor = isSmallScreenSize ? .systemBlue : .white
        selectionBackgroundView.isHidden = isSmallScreenSize
    }

    func applyDefaultStyle(isWithinDisplayedMonth: Bool) {
        accessibilityTraits.remove(.selected)
        accessibilityHint = "Tap to select"
        numberLabel.textColor = isWithinDisplayedMonth ? UIColor.Andes.gray800 : UIColor.Andes.gray250
        selectionBackgroundView.isHidden = true
    }
}
