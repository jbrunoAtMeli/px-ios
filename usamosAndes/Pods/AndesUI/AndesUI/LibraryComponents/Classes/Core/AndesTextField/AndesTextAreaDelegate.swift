//
//  AndesTextAreaDelegate.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/7/20.
//

import Foundation
@objc public protocol AndesTextAreaDelegate {
    @objc optional func andesTextAreaShouldBeginEditing(_ textArea: AndesTextArea) -> Bool
    @objc optional func andesTextAreaShouldEndEditing(_ textArea: AndesTextArea) -> Bool
    @objc optional func andesTextAreaDidBeginEditing(_ textArea: AndesTextArea)
    @objc optional func andesTextAreaDidEndEditing(_ textArea: AndesTextArea)
    @objc optional func andesTextArea(_ textArea: AndesTextArea, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    @objc optional func andesTextAreaDidChangeSelection(_ textArea: AndesTextArea, selectedRange range: UITextRange?)
    @objc optional func andesTextAreaDidChange(_ textArea: AndesTextArea)
}
