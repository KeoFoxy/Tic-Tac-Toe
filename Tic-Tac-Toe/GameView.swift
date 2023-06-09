//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 04.06.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @StateObject private var resetButtonViewModel: ControlButtonsModel
    
    init() {
        let scoreViewModel = ScoreViewModel()
        let controlButtonsModel = ControlButtonsModel(scoreViewModel: scoreViewModel)
        _resetButtonViewModel = StateObject(wrappedValue: controlButtonsModel)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
//                ScoreView(viewModel: resetButtonViewModel.scoreViewModel)
                ScoreView(viewModel: ScoreViewModel.shared)
//                ScoreView(viewModel: scoreViewModel)
                Spacer()
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
                Spacer()
                ControlButtonsView(controlButtonsModel: resetButtonViewModel)
//                ControlButtonsView(viewModel: controlButtonsModel)
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
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
