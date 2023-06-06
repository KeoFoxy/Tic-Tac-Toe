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
                        isGameboardDisabled = true
                        
                            //Check for WIN or DRAW
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            let AIPositon = determineAIMovePosition(in: moves)
                            moves[AIPositon] = Move(player: .AI, boardIndex: AIPositon)
                            isGameboardDisabled = false
                        }
                    }
                }
            }
        }
        .disabled(isGameboardDisabled)
        .padding()
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func determineAIMovePosition(in moves: [Move?]) -> Int {
        var movePositon = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePositon) {
            movePositon = Int.random(in: 0..<9)
        }
        
        return movePositon
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
