//
//  PlayerIndicatorView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 06.06.2023.
//

import SwiftUI

struct PlayerIndicator: View {
    
    var SystemImageName: String
    var body: some View {
        Image(systemName: SystemImageName)
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
    }
}
