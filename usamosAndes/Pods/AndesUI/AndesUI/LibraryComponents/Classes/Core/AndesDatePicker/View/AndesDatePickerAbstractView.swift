//
//  AndesDatePickerAbstractView.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation

protocol AndesDatePickerAbstractViewDelegate: class {
    func didSelectDate(_ date: Date?, _ isConfirmed: Bool)
}

internal class AndesDatePickerAbstractView: UIView, AndesDatePickerView {

    // MARK: - IBOutlet

    @IBOutlet var datePickerView: UIView!
    @IBOutlet var datePickerCollectionView: UICollectionView!
    @IBOutlet var buttonPrimary: AndesButton!

    // MARK: - Attributes

    internal var backgroundLayer = CALayer()
    weak var delegate: AndesDatePickerAbstractViewDelegate?
    internal var dataCollectionView: AndesDatePickerSettingCollection?

    internal var selectedDate: Date? = Date() {
        didSet {
            if selectedDate != nil {
                lastSelectedDate = selectedDate
            }
        }
    }
    internal var lastSelectedDate: Date?
    private(set) var dayCalendar = AndesDayDatePicker()
    private var calendar = Calendar(identifier: .iso8601)
    private(set) lazy var daysToRender = dayCalendar.getDaysInMonth(Date(), nil)

    private(set) var baseDate: Date {
        didSet {
            daysToRender = dayCalendar.getDaysInMonth(baseDate, selectedDate)
            dataCollectionView?.days = daysToRender
            dataCollectionView?.currentDate = baseDate
            datePickerCollectionView.reloadData()
        }
    }

    override public var frame: CGRect {
        didSet {
            datePickerView?.frame = frame
        }
    }

    // MARK: - Instantiate

    internal init() {
        baseDate = Date()
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        baseDate = Date()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() { }

    // MARK: - Class methods

    func setDates(maxDate: Date?) {
        maxDate != nil ? setup() : ()
        dayCalendar = AndesDayDatePicker(endDate: maxDate)
        dayCalendar.delegate = self
        setupCollectionView()
        baseDate = Date()
    }

    private func setup() {
        loadNib()
        datePickerView.layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerView)
        backgroundLayer = datePickerView.layer
        datePickerView.pinToSuperview()

        buttonPrimary.text = "Confirmar".localized()
        buttonPrimary.size = .large

        buttonPrimary.isEnabled = false
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        datePickerCollectionView.collectionViewLayout = layout
        datePickerCollectionView.isScrollEnabled = false

        dataCollectionView = AndesDatePickerSettingCollection(baseDate: Date(), daysToRender: daysToRender)
        dataCollectionView?.delegate = self
        datePickerCollectionView.dataSource = dataCollectionView
        datePickerCollectionView.delegate = dataCollectionView

        datePickerCollectionView.register(AndesDatePickerCell.self, forCellWithReuseIdentifier: AndesDatePickerCell.identifier)
        datePickerCollectionView.register(AndesDatePickerHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AndesDatePickerHeaderView")
    }

    // MARK: - IBAction

    @IBAction func didTouchConfirm(_ sender: AndesButton) {
        delegate?.didSelectDate(lastSelectedDate, true)
    }
}

extension AndesDatePickerAbstractView: AndesDatePickerSettingCollectionDelegate {
    func didSelectDate(_ date: Date?) {
        selectedDate = date
        buttonPrimary.isEnabled = true
        delegate?.didSelectDate(selectedDate, false)
    }

    func didTouchNextMonth() {
        baseDate = calendar.date(byAdding: .month, value: 1, to: baseDate) ?? baseDate
    }

    func didTouchPreviousMonth() {
        baseDate = calendar.date(byAdding: .month, value: -1, to: baseDate) ?? baseDate
    }
}

extension AndesDatePickerAbstractView: AndesDayDatePickerDelegate {
    func didSelectEnabledDay(_ day: Date?) {
        selectedDate = day
        buttonPrimary.isEnabled = true
    }
}
