//
//  AndesListDelegate.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import Foundation
/// Protocol of AndesList behaviour
@objc public protocol AndesListDelegate {

    @objc optional func andesList(_ listView: AndesList, didSelectRowAt indexPath: IndexPath)

}
