//
//  AndesTextFieldSideComponentFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import UIKit
internal class AndesTextFieldComponentFactory {
    static func generateLeftComponentView(for config: AndesTextFieldViewConfig, in view: AndesTextFieldView? = nil, visibilities: [AndesTextFieldComponentVisibility]) -> UIView? {
        let leftPadding = config.paddings.left
        guard let visibility = config.leftViewComponent?.visibility, visibilities.contains(visibility) else {
            return TextFieldPaddingView(size: leftPadding)
        }

        switch config.leftViewComponent {
        case let component as AndesTextFieldComponentLabel:
            return AndesTextFieldLabelView(text: component.text, style: component.style, forceLeftPadding: leftPadding)
        case let component as AndesTextFieldComponentIcon:
            return AndesTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        default:
              return TextFieldPaddingView(size: leftPadding)
        }
    }

    static func generateRightComponentView(for config: AndesTextFieldViewConfig, in view: AndesTextFieldView? = nil, visibilities: [AndesTextFieldComponentVisibility]) -> UIView? {
        let rightPadding = config.paddings.right
        guard let visibility = config.rightViewComponent?.visibility, visibilities.contains(visibility) else {
            return TextFieldPaddingView(size: rightPadding)
        }

        switch config.rightViewComponent {
        case let component as AndesTextFieldComponentLabel:
            return AndesTextFieldLabelView(text: component.text, style: component.style, forceRightPadding: rightPadding)
        case let component as AndesTextFieldComponentIcon:
            return AndesTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case let component as AndesTextFieldComponentCheck:
            return AndesTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case let component as AndesTextFieldComponentClear:
             return AndesTextFieldClearView(iconColor: component.iconColor, iconName: component.clearIcon) { [weak view] in
                view?.clear()
            }
        case let component as AndesTextFieldComponentAction:
            return AndesTextFieldActionView(label: component.label) {[weak view] in
                view?.delegate?.didTapRightAction()
            }
        default:
            return TextFieldPaddingView(size: rightPadding)
        }
    }
}
