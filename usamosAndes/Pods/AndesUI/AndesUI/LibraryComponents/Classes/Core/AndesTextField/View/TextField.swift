//
//  TextField.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 30/09/2020.
//

import Foundation

// Internal class created so as to handle deleteBackward action
final class TextField: UITextField {
    override func deleteBackward() {
        let wasEmpty = text?.isEmpty ?? true
        super.deleteBackward()
        (delegate as? TextFieldDelegate)?.textField(self, didDeleteBackwardAnd: wasEmpty)
    }
}

protocol TextFieldDelegate: UITextFieldDelegate {
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool)
}
