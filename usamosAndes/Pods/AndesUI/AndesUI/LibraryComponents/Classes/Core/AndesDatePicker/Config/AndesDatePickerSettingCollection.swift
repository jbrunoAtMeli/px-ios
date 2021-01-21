//
//  AndesDatePickerSettingCollection.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 09/11/20.
//

import UIKit

/// This class has all collectionview implementation (UICollectionViewDataSource and UICollectionViewDelegate)

protocol AndesDatePickerSettingCollectionDelegate: AnyObject {
    func didTouchNextMonth()
    func didTouchPreviousMonth()
    func didSelectDate(_ date: Date?)
}

@objc class AndesDatePickerSettingCollection: NSObject, UICollectionViewDataSource {

    // MARK: - Attributes

    var days: [AndesDayDatePicker] = []
    var currentDate: Date

    weak var delegate: AndesDatePickerSettingCollectionDelegate?

    private var calendar = Calendar(identifier: .iso8601)
    private var header: AndesDatePickerHeaderView?

    // MARK: - Initializer

    init(baseDate: Date, daysToRender daysToRenderInMonth: [AndesDayDatePicker]) {
        self.days = daysToRenderInMonth
        self.currentDate = baseDate
    }

    // MARK: - UICollectionViewDataSource

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let day = days[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AndesDatePickerCell.identifier, for: indexPath) as? AndesDatePickerCell else {
            fatalError("error to create AndesDatePickerCell")
        }
        cell.day = day

        return cell
    }
}

extension AndesDatePickerSettingCollection: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let day = days[indexPath.item]
        if day.isValid {
            days.forEach({ $0.selected = false })
            day.selected.toggle()
            collectionView.reloadData()
        }
        day.isValid ? delegate?.didSelectDate(day.date) : delegate?.didSelectDate(nil)
    }
}

extension AndesDatePickerSettingCollection: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width / 7)
        return CGSize(width: width, height: 29)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80.0)
    }

    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AndesDatePickerHeaderView.identifier, for: indexPath) as? AndesDatePickerHeaderView
            header?.delegate = self
            header?.currentDate = currentDate
            header?.togglePreviousButton(days: days)

            return header ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}

extension AndesDatePickerSettingCollection: AndesDatePickerHeaderViewDelegate {
    func nextMonth() {
        delegate?.didTouchNextMonth()
    }

    func previousMonth() {
        delegate?.didTouchPreviousMonth()
    }
}
