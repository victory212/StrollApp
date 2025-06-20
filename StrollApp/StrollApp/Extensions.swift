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
    static let timeColor = Color(hex: "#555390")
    static let newChatColor = Color(hex: "#42406FCC")
    static let starredColor = Color(hex: "#B5B2FF")
    
    static let backgroundGradientColor = LinearGradient(colors: [
        Color(hex: "#0B0D0E00"),
        Color(hex: "#0B0D0E"),
        Color(hex: "#0B0D0E")
    ], startPoint: .top, endPoint: .bottom)
    
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

extension Font {
    static func interBold(size: CGFloat) -> Font {
        .custom("Inter24pt-Bold", size: size)
    }
    
    static func proximaRegular(size: CGFloat) -> Font {
        .custom("ProximaNova-Regular", size: size)
    }
    
    static func proximaRegularItalic(size: CGFloat) -> Font {
        .custom("ProximaNovaCond-RegularIt", size: size)
    }

    
    static func proximaLight(size: CGFloat) -> Font {
        .custom("ProximaNova-Light", size: size)
    }
    
    static func proximaSemiBold(size: CGFloat) -> Font {
        .custom("ProximaNovaCond-Semibold", size: size)
    }

    static func proximaBold(size: CGFloat) -> Font {
        .custom("ProximaNova-Bold", size: size)
    }

    static func proximaBoldItalic(size: CGFloat) -> Font {
        .custom("ProximaNova-BoldIt", size: size)
    }

    static func proximaExtraBold(size: CGFloat) -> Font {
        .custom("ProximaNova-ExtraBold", size: size)
    }

    static func proximaBlack(size: CGFloat) -> Font {
        .custom("ProximaNova-Black", size: size)
    }

    static func proximaBlackItalic(size: CGFloat) -> Font {
        .custom("ProximaNova-BlackIt", size: size)
    }
}
