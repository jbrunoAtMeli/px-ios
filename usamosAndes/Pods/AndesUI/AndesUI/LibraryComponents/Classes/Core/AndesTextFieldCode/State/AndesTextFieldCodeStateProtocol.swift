//
//  AndesTextFieldCodeStateProtocol.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

protocol AndesTextFieldCodeStateProtocol {
    var labelTextColor: UIColor { get }
    var helperTextColor: UIColor { get }
    var helperSemibold: Bool { get }
    var helperIconName: String? { get }
    var helperIconTintColor: UIColor? { get }
    var helperIconBgColor: UIColor { get }
}
