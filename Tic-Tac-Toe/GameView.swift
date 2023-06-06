//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 04.06.2023.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: viewModel.columns) {
                ForEach(0..<9) { i in
                    ZStack{
                        GameSquareView()
                        PlayerIndicator(SystemImageName: viewModel.moves[i]?.indicator ?? "")
                    }
                    .onTapGesture {
                        viewModel.processPlayerMove(for: i)
                    }
                }
            }
        }
        .disabled(viewModel.isGameboardDisabled)
        .padding()
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
        })
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
