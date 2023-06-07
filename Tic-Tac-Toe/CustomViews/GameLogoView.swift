//
//  GameLogoView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 06.06.2023.
//

import SwiftUI

struct GameLogoView: View {
    var text: String
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(text), id: \.self) { char in
                Text(String(char))
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .scaleEffect(1.2) // Начальный размер буквы
                    .animation(Animation.easeOut(duration: 0.3).repeatForever(autoreverses: true)) // Анимация подпрыгивания
            }
        }
    }
}

struct GameLogoView_Previews: PreviewProvider {
    static var previews: some View {
        GameLogoView(text: "Tic Tac Toe")
    }
}
