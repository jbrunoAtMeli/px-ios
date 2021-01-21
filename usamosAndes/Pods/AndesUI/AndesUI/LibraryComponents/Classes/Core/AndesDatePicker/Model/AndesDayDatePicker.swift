//
//  AndesDayDatePicker.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 10/11/20.
//

import Foundation

protocol AndesDayDatePickerDelegate: class {
    func didSelectEnabledDay(_ day: Date?)
}

@objc class AndesDayDatePicker: NSObject {

    // MARK: - Attributes

    private(set) var date: Date
    private(set) var number: String
    private(set) var isCurrentMonth: Bool
    private(set) var isValid: Bool
    private(set) var dueDate: Date?

    private(set) var lastDay: Date?

    var selected: Bool {
        didSet {
            if selected {
                delegate?.didSelectEnabledDay(lastDay)
            }
        }
    }
    weak var delegate: AndesDayDatePickerDelegate?

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }()

    init(date: Date? = Date(), number: String = "", selected: Bool = false, isCurrentMonth: Bool = false, endDate: Date? = nil, isValid: Bool = false) {
        self.date = date ?? Date()
        self.number = number
        self.selected = selected
        self.isCurrentMonth = isCurrentMonth
        self.dueDate = endDate
        self.isValid = isValid
    }

    // MARK: - Struct methods

    /// this method creates all days of the month

    func getDaysInMonth(_ currentDate: Date, _ selectedDate: Date?) -> [AndesDayDatePicker] {
        guard let monthData = try? AndesMonthDatePicker.getMonthData(currentDate) else {
            fatalError("error to load the month in date: \(date)")
        }

        let daysNumberInMonth = monthData.daysNumber
        let offsetToInitialRow = monthData.firstWeekday
        let firstDay = monthData.firstDay

        var daysToRenderInMonth: [AndesDayDatePicker] = (1..<(daysNumberInMonth + offsetToInitialRow)).map { day in
            let dayOffSet = isCurrentMonth ? day - offsetToInitialRow : -(offsetToInitialRow - day)

            let calendar = Calendar(identifier: .gregorian)
            let date = calendar.date(byAdding: .day, value: dayOffSet, to: firstDay) ?? firstDay
            self.lastDay = date

            let isCurrentMonth = hasRange() ? dateIsInRange(date) : day >= offsetToInitialRow
            isValid = hasRange() ? dateIsInRange(date) : true

            if dueDate != nil && selectedDate == nil {
                selected = calendar.compare(date, to: dueDate ?? Date(), toGranularity: .day) == .orderedSame
            } else {
                selected = calendar.isDate(date, inSameDayAs: selectedDate ?? Date())
            }

            return AndesDayDatePicker(date: date, number: dateFormatter.string(from: date), selected: selected, isCurrentMonth: isCurrentMonth, endDate: dueDate, isValid: isValid)
        }

        daysToRenderInMonth += generateStartOfNextMonth(using: firstDay, selectedDate: Date())

        return daysToRenderInMonth
    }

    /// this method creates the missing days to fill the last week

    func generateStartOfNextMonth(using firstDayOfDisplayedMonth: Date, selectedDate: Date) -> [AndesDayDatePicker] {

        let calendar = Calendar(identifier: .gregorian)
        guard let lastDayInMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1),
                                                 to: firstDayOfDisplayedMonth) else { return [] }
        let additionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth) + 1

        guard additionalDays > 0 else {
            return []
        }
        let days: [AndesDayDatePicker] = (1...additionalDays)
            .map {
                let date = calendar.date(byAdding: .day, value: $0, to: lastDayInMonth) ?? lastDayInMonth
                isValid = hasRange() ? dateIsInRange(date) : true

                return AndesDayDatePicker(date: date,
                                        number: dateFormatter.string(from: date),
                                        selected: calendar.isDate(date, inSameDayAs: selectedDate),
                                        isCurrentMonth: false, isValid: isValid)
        }

        return days
    }

    /// given a date it checks if it is within the range

    private func dateIsInRange(_ date: Date) -> Bool {
        guard let end = dueDate else { return false }

        if Calendar.current.compare(date, to: Date(), toGranularity: .day) == .orderedDescending && Calendar.current.compare(date, to: end, toGranularity: .day) == .orderedSame {
            return true
        }

        return date.compare(Date()) == .orderedDescending && date.compare(end) == .orderedAscending
    }

    func hasRange() -> Bool {
        return dueDate != nil
    }
}
