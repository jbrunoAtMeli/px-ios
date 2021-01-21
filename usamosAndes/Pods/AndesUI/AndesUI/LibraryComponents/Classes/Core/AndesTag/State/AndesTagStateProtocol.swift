//
//  AndesTagStateProtocol.swift
//  AndesUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation

protocol AndesTagStateProtocol {
    var textColor: UIColor { get }
    var borderColor: UIColor { get }
    var buttonColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var rightButtonImageName: String? { get }
}
