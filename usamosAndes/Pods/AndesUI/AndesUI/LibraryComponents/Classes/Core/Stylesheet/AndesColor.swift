//
//  AndesColor.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

@objc extension UIColor {
    /// Andes Color Palette
    @objc(AndesColors) public class Andes: NSObject {
        @objc public static let white = UIColor(hex: "#FFFFFF")!

        @objc public static let gray040 = UIColor(hex: "#0A000000")!
        @objc public static let gray070 = UIColor(hex: "#12000000")!
        @objc public static let gray100 = UIColor(hex: "#1A000000")!
        @objc public static let gray250 = UIColor(hex: "#40000000")!
        @objc public static let gray450 = UIColor(hex: "#73000000")!
        @objc public static let gray800 = UIColor(hex: "#CC000000")!

        @objc public static let graySolid040 = UIColor(hex: "#F5F5F5")!
        @objc public static let graySolid070 = UIColor(hex: "#EDEDED")!
        @objc public static let graySolid100 = UIColor(hex: "#E5E5E5")!
        @objc public static let graySolid250 = UIColor(hex: "#B5B5B5")!
        @objc public static let graySolid450 = UIColor(hex: "#8C8C8C")!
        @objc public static let graySolid800 = UIColor(hex: "#333333")!

        @objc public static let yellowML500 = UIColor(hex: "#FFE602")!

        @objc public static let blueML100 = UIColor(hex: "#1A4189E6")!
        @objc public static let blueML150 = UIColor(hex: "#264189E6")!
        @objc public static let blueML200 = UIColor(hex: "#334189E6")!
        @objc public static let blueML300 = UIColor(hex: "#4D4189E6")!
        @objc public static let blueML400 = UIColor(hex: "#664189E6")!
        @objc public static let blueML500 = UIColor(hex: "#3483FA")!
        @objc public static let blueML600 = UIColor(hex: "#2968C8")!
        @objc public static let blueML700 = UIColor(hex: "#1F4E96")!
        @objc public static let blueML800 = UIColor(hex: "#183C73")!

        @objc public static let blueMP100 = UIColor(hex: "#1A479AD1")!
        @objc public static let blueMP150 = UIColor(hex: "#26479AD1")!
        @objc public static let blueMP200 = UIColor(hex: "#33479AD1")!
        @objc public static let blueMP300 = UIColor(hex: "#4D479AD1")!
        @objc public static let blueMP400 = UIColor(hex: "#66479AD1")!
        @objc public static let blueMP500 = UIColor(hex: "#009EE3")!
        @objc public static let blueMP600 = UIColor(hex: "#007EB5")!
        @objc public static let blueMP700 = UIColor(hex: "#005E88")!
        @objc public static let blueMP800 = UIColor(hex: "#004766")!

        @objc public static let green100 = UIColor(hex: "#1A00A650")!
        @objc public static let green150 = UIColor(hex: "#2600A650")!
        @objc public static let green200 = UIColor(hex: "#3300A650")!
        @objc public static let green300 = UIColor(hex: "#4D00A650")!
        @objc public static let green400 = UIColor(hex: "#6600A650")!
        @objc public static let green500 = UIColor(hex: "#00A650")!
        @objc public static let green600 = UIColor(hex: "#008744")!
        @objc public static let green700 = UIColor(hex: "#006633")!
        @objc public static let green800 = UIColor(hex: "#004D27")!

        @objc public static let orange100 = UIColor(hex: "#1AFF7733")!
        @objc public static let orange150 = UIColor(hex: "#26FF7733")!
        @objc public static let orange200 = UIColor(hex: "#33FF7733")!
        @objc public static let orange300 = UIColor(hex: "#4DFF7733")!
        @objc public static let orange400 = UIColor(hex: "#66FF7733")!
        @objc public static let orange500 = UIColor(hex: "#FF7733")!
        @objc public static let orange600 = UIColor(hex: "#E6540B")!
        @objc public static let orange700 = UIColor(hex: "#CC3E0A")!
        @objc public static let orange800 = UIColor(hex: "#A62A08")!

        @objc public static let red100 = UIColor(hex: "#1AF23D4F")!
        @objc public static let red150 = UIColor(hex: "#26F23D4F")!
        @objc public static let red200 = UIColor(hex: "#33F23D4F")!
        @objc public static let red300 = UIColor(hex: "#4DF23D4F")!
        @objc public static let red400 = UIColor(hex: "#66F23D4F")!
        @objc public static let red500 = UIColor(hex: "#F23D4F")!
        @objc public static let red600 = UIColor(hex: "#D12440")!
        @objc public static let red700 = UIColor(hex: "#A61D33")!
        @objc public static let red800 = UIColor(hex: "#801627")!
    }
}

internal extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    /// init UIColor with hex code
    /// - Parameter hex: color representation, e.g: "#FFFFFF" or with alpha "#FF000000"
    convenience init?(hex: String) {
        var cString: String = hex.uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue: UInt64 = 0
        guard (cString.count == 6 || cString.count == 8) &&
            Scanner(string: cString).scanHexInt64(&rgbValue) else {
            return nil
        }
        if cString.count == 6 {
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        } else {
            self.init(
                red: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x000000FF) / 255.0,
                alpha: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            )
        }
    }
}
