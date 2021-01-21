//
//  AndesTextFieldCodeViewConfigFactory.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class AndesTextFieldCodeViewConfigFactory {

    static func provideInternalConfig(from textFieldCode: AndesTextFieldCode) -> AndesTextFieldCodeViewConfig {
        let stateStyle = AndesTextFieldCodeStateFactory.getState(textFieldCode.state)
        return AndesTextFieldCodeViewConfig(labelText: textFieldCode.label, helperText: textFieldCode.helpLabel, style: textFieldCode.style, state: textFieldCode.state, stateStyle: stateStyle)
    }
}
