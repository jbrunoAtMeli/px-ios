//
//  AndesMonthDatePicker.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 10/11/20.
//

import Foundation

enum AndesMonthDatePickerError: Error {
    case errorLoadingDates
}

struct AndesMonthDatePicker {

    // MARK: - Attributes

    let daysNumber: Int
    let firstDay: Date
    let firstWeekday: Int

    // MARK: - Struct methods

    /// this method creates AndesMonthDatePicker object, that contains: the number of days in the month, first day month

    static func getMonthData(_ date: Date) throws -> AndesMonthDatePicker {
        let calendar = Calendar(identifier: .gregorian)

        let daysMonth = calendar.range(of: .day, in: .month, for: date)
        guard let daysNumberInMonth = daysMonth?.count, let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
            throw AndesMonthDatePickerError.errorLoadingDates
        }

        var firstWeekDay = calendar.component(.weekday, from: firstDay)

        if firstWeekDay == 1 { firstWeekDay = 7 } else { firstWeekDay = firstWeekDay-1 }

        return AndesMonthDatePicker(daysNumber: daysNumberInMonth, firstDay: firstDay, firstWeekday: firstWeekDay)
    }
}
