//
//  AndesBodyLink.swift
//  AndesUI
//
//  Created by Marcelo Agustin Gil on 27/07/2020.
//

public class AndesBodyLink {
    var startIndex: Int
    var endIndex: Int

    public init(startIndex: Int, endIndex: Int) {
        self.startIndex = startIndex
        self.endIndex = endIndex
    }

    func isValidRange(_ text: NSAttributedString) -> Bool {
        return (startIndex >= 0 && endIndex >= 0 && startIndex <= endIndex && endIndex <= text.length)
    }
}
