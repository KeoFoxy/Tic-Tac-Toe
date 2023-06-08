//
//  ControlButtonsModel.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 08.06.2023.
//

import SwiftUI
import Combine

final class ControlButtonsModel: ObservableObject {
    var isGameStarted: Bool = false
    
    func StartGame() -> Bool {
        return true
    }
}
