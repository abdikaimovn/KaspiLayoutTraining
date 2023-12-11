//
//  UIColor+extension.swift
//  kaspiLayoutTraining
//
//  Created by Нурдаулет on 08.12.2023.
//

import UIKit

extension UIColor {
    static var shared = UIColor()
    convenience init?(hex: String) {
        var formattedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        
        Scanner(string: formattedHex).scanHexInt64(&rgbValue)
        
        if formattedHex.count == 6 {
            formattedHex = "FF" + formattedHex
        }
        
        if let red = UInt8(exactly: (rgbValue & 0xFF0000) >> 16),
           let green = UInt8(exactly: (rgbValue & 0x00FF00) >> 8),
           let blue = UInt8(exactly: (rgbValue & 0x0000FF) >> 0) {
                self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        } else {
            return nil
        }
    }
}
