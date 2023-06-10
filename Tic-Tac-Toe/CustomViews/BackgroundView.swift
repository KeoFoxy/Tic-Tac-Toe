//
//  BackgroundView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 07.06.2023.
//

import SwiftUI
import RiveRuntime

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()

            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 10)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
