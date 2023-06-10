//
//  MovesModel.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 06.06.2023.
//

enum Player {
    case human, AI
}

struct Move {
    let player: Player
    let boardIndex: Int

    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}
