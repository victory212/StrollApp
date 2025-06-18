//
//  Extensions.swift
//  StrollApp
//
//  Created by Okoi Victory Ebri on 18/06/2025.
//

import Foundation
import SwiftUI

extension Color {
    static let appPurple = Color(hex: "#B49AD1")
    
    init(hex: String) {
        // Trim whitespaces and remove '#' if present
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized

        var rgbValue: UInt64 = 0
        let scanner = Scanner(string: hexSanitized)
        guard scanner.scanHexInt64(&rgbValue) else {
            // If scanning fails, default to black
            self = .black
            return
        }

        let red, green, blue, alpha: Double

        switch hexSanitized.count {
        case 6: // RRGGBB
            red   = Double((rgbValue & 0xFF0000) >> 16) / 255
            green = Double((rgbValue & 0x00FF00) >> 8) / 255
            blue  = Double(rgbValue & 0x0000FF) / 255
            alpha = 1.0
        case 8: // RRGGBBAA
            red   = Double((rgbValue & 0xFF000000) >> 24) / 255
            green = Double((rgbValue & 0x00FF0000) >> 16) / 255
            blue  = Double((rgbValue & 0x0000FF00) >> 8) / 255
            alpha = Double(rgbValue & 0x000000FF) / 255
        default:
            // If format is incorrect, fallback to black
            red = 0
            green = 0
            blue = 0
            alpha = 1.0
        }

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
