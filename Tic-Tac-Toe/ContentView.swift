//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 04.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameboardDisabled: Bool = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(0..<9) { i in
                    ZStack {
                        Rectangle()
                            .aspectRatio(1, contentMode: .fit)
                            .foregroundColor(.clear)
                            .background(FieldBackground)
                            .cornerRadius(10)
                        Image(systemName: moves[i]?.indicator ?? "")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        if isSquareOccupied(in: moves, forIndex: i) { return }
                        moves[i] = Move(player: .human, boardIndex: i)
                        
                            //Check for WIN or DRAW
                        if checkWinCondition(for: .human, in: moves) {
                            alertItem = AlertContext.humanWin
                            return
                        }
                        
                        if checkDrawCondition(in: moves) {
                            alertItem = AlertContext.draw
                            return
                        }
                        
                        isGameboardDisabled = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            let AIPositon = determineAIMovePosition(in: moves)
                            moves[AIPositon] = Move(player: .AI, boardIndex: AIPositon)
                            isGameboardDisabled = false
                            
                            if checkWinCondition(for: .AI, in: moves) {
                                alertItem = AlertContext.AIWin
                                return
                            }
                            
                            if checkDrawCondition(in: moves) {
                                alertItem = AlertContext.draw
                                return
                            }
                        }
                    }
                }
            }
        }
        .disabled(isGameboardDisabled)
        .padding()
        .alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .default(alertItem.buttonTitle, action: { resetGame() }))
        })
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    // If Ai can win, then win
    // If Ai can't win, then block
    // If Ai can't block, then take middle square
    // If Ai can't take middle square, then random available square
    
    func determineAIMovePosition(in moves: [Move?]) -> Int {
        
        // If Ai can win, then win
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let AIMoves = moves.compactMap { $0 }.filter { $0.player == .AI }
        let AIPositions = Set(AIMoves.map { $0.boardIndex } )
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(AIPositions)
            
            if winPositions.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        // If Ai can't win, then block
        let humanMoves = moves.compactMap { $0 }.filter { $0.player == .human }
        let humanPositions = Set(humanMoves.map { $0.boardIndex } )
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(humanPositions)
            
            if winPositions.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        
        // If Ai can't block, then take middle square
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare) {
            return centerSquare
        }
        
        
        // If Ai can't take middle square, then random available square
        var movePositon = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePositon) {
            movePositon = Int.random(in: 0..<9)
        }
        
        return movePositon
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map { $0.boardIndex } )
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions){ return true }
        
        return false
    }
    
    func checkDrawCondition(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
