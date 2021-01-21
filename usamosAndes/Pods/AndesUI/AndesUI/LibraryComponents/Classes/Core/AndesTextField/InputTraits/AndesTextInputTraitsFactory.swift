//
//  AndesTextInputTraitsFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
internal class AndesTextInputTraitsFactory: NSObject {
    static func getTraits(for type: AndesTextInputTraits) -> UITextInputTraits? {
        switch type {
        case .password:
            return AndesTextInputTraitsPassword()
        case .email:
            return AndesTextInputTraitsEmail()
        case .numberPad:
            return AndesTextInputTraitsNumberPad()
        case .custom:
            return nil
        }
    }
}

@objc internal class AndesTextInputTraitsEmail: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .emailAddress
    var textContentType: UITextContentType! = .emailAddress
}

@objc internal class AndesTextInputTraitsPassword: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .default
    var isSecureTextEntry: Bool = true
}

@objc internal class AndesTextInputTraitsNumberPad: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .numberPad
}
