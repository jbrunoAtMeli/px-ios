//
//  AndesTagLeftContentImage.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation

@objc public class AndesTagLeftContentImage: NSObject, AndesTagLeftContent {
    var avatar: UIImage

    @objc public init(avatar: UIImage) {
        self.avatar = avatar
        super.init()
    }
}
