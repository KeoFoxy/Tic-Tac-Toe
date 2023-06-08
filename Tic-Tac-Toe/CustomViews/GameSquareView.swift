//
//  GameSquareView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 06.06.2023.
//

import SwiftUI

struct GameSquareView: View {
    
    var body: some View {
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .foregroundColor(.clear)
            .background(FieldBackground)
            .cornerRadius(10)
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.white, lineWidth: 10)
//                    .opacity(0.25)
//            )
    }
}

struct GameSquareView_Previews: PreviewProvider {
    static var previews: some View {
        GameSquareView()
    }
}
