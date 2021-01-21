//
//  AndesTagLeftComponentFactory.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation

class AndesTagLeftContentFactory {

    static func generateLeftContentView(for leftContent: AndesTagLeftContent) -> UIView? {
        switch leftContent {
        case let content as AndesTagLeftContentDot:
            return AndesTagLeftContentDotView(backgroundColor: content.backgroundColor, text: content.text, textColor: content.textColor)
        case let content as AndesTagLeftContentIcon:
            return AndesTagLeftContentIconView(backgroundColor: content.backgroundColor, icon: content.icon, iconColor: content.iconColor)
        case let content as AndesTagLeftContentImage:
            return AndesTagLeftContentImageView(image: content.avatar)
        default:
            return nil
        }
    }
}
