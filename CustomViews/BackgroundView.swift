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
            Image("Spline")
                .blur(radius: 50)
                .offset(x: 200, y: 100)
                .frame(maxWidth: 200, maxHeight: .infinity)
            
            RiveViewModel(fileName: "shapes").view()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .blur(radius: 30)
                .blendMode(.hardLight)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
