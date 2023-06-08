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
            AngGradietn.blur(radius: 5)
            LinGradient
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 20)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
