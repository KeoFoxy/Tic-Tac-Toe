//
//  CustomFont.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 07.06.2023.
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

