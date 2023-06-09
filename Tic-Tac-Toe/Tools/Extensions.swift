//
//  Extensions.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 09.06.2023.
//

import SwiftUI

extension Font {
    static func customFont(_ name: String, size: CGFloat) -> Font {
        guard let font = UIFont(name: name, size: size) else {
            return Font.system(size: size)
        }
        return Font(font)
    }
}
// Color via HEX
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.index(after: hex.startIndex)

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
