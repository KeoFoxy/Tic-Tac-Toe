//
//  ScoreView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 08.06.2023.
//

import SwiftUI

struct ScoreView: View {
//    @ObservedObject var viewModel: ScoreViewModel.shared
    @StateObject var viewModel = ScoreViewModel.shared
    
    var body: some View {
        VStack {
            Text("Wins: \(viewModel.wins)")
                .font(.title)
            
            Text("Losses: \(viewModel.losses)")
                .font(.title)
            
            Text("Draws: \(viewModel.draws)")
                .font(.title)
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView(viewModel: <#ScoreViewModel#>)
//    }
//}
