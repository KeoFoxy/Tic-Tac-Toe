//
//  ScoreViewModel.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 08.06.2023.
//

import SwiftUI

final class ScoreViewModel: ObservableObject {
    
    static let shared = ScoreViewModel()
    
    @Published var wins: Int = 0
    @Published var losses: Int = 0
    @Published var draws: Int = 0
    
    func increseWinScore() {
        wins += 1
    }
    
    func increseDrawScore() {
        draws += 1
    }
    
    func increseLoseScore() {
        losses += 1
    }
    
    func resetScore() {
        wins = 0
        losses = 0
        draws = 0
    }
}
