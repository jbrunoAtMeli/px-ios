//
//  String+Additions.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/23/20.
//

import Foundation

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }

    func stringToFloat() -> CGFloat? {
        guard let number = Float(self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) else {
            return nil
        }
        return CGFloat(number)
    }
}
