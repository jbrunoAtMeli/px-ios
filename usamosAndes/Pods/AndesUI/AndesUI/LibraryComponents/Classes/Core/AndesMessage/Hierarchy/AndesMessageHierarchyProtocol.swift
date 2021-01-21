//
//  AndesMessageHierarchyProtocol.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/13/20.
//

import Foundation

internal protocol AndesMessageHierarchyProtocol {
    var backgroundColor: UIColor { get }
    var dismissButtonColor: UIColor { get }
    var textColor: UIColor { get }
    var pipeColor: UIColor { get }
    var accentColor: UIColor { get }
    var primaryButtonHierarchy: AndesButtonHierarchyProtocol { get }
    var secondaryButtonHierarchy: AndesButtonHierarchyProtocol { get }
    var linkButtonHierarchy: AndesButtonHierarchyProtocol { get }
    var bodyLinkIsUnderline: Bool { get }
    var bodyLinkTextColor: UIColor { get }
}
