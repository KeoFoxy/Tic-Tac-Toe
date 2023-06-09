//
//  ControlButtonsModel.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 08.06.2023.
//

import SwiftUI

final class ControlButtonsModel: ObservableObject {
    var scoreViewModel: ScoreViewModel
    
    init(scoreViewModel: ScoreViewModel) {
        self.scoreViewModel = scoreViewModel
    }
    
    func resetScore() {
        scoreViewModel.resetScore()
    }
}
