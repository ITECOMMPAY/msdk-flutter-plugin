//
//  Color.swift
//  ecmpplugin
//
//  Created by Alex on 19.04.2024.
//

import UIKit

extension UIColor {
    /// Creates a color object from a hexadecimal string representation.
    ///
    /// Supported formats:
    /// - 6 characters (RGB): "#RRGGBB" - alpha channel defaults to 1.0
    /// - 8 characters (RGBA): "#RRGGBBAA" - last two characters represent alpha
    ///
    /// - Parameter hex: The hexadecimal color string
    ///   - Must start with "#" prefix
    ///   - Case insensitive
    ///   - Valid characters: 0-9, A-F
    ///
    /// - Examples:
    ///   - Pure white: "#FFFFFF"
    ///   - Semi-transparent black: "#00000080" (alpha ≈ 0.5)
    ///   - Solid red: "#FF0000"
    ///
    /// - Returns: Initialized UIColor object, or `nil` for invalid formats
    public convenience init?(hex: String) {
        // Validate presence of "#" prefix
        guard hex.hasPrefix("#") else { return nil }

        // Extract hex content after "#"
        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexString = String(hex[start...])
        let len = hexString.count

        // Validate supported lengths (6 or 8 characters)
        guard len == 6 || len == 8 else { return nil }

        var hexNumber: UInt64 = 0
        // Scan hexadecimal value
        guard Scanner(string: hexString).scanHexInt64(&hexNumber) else { return nil }

        let r, g, b, a: CGFloat

        if len == 6 {
            // 6-character format (RRGGBB)
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00FF00) >> 8)  / 255
            b = CGFloat( hexNumber & 0x0000FF)        / 255
            a = 1.0  // Default alpha
        } else {
            // 8-character format (RRGGBBAA)
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8)  / 255
            a = CGFloat( hexNumber & 0x000000FF)        / 255
        }

        // Initialize color with calculated components
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
