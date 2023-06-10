//
//  ScoreView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 08.06.2023.
//

import SwiftUI
import RiveRuntime

struct ScoreView: View {
    @StateObject var viewModel = ScoreViewModel.shared
    let ScoreField = RiveViewModel(fileName: "score", autoPlay: false)
    
    var body: some View {
        ZStack {
            ScoreField.view()
                .frame(width: 275, height: 200)
            Score
                .frame(width: 150)
        }
    }
    
    var Score: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Wins:")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                Spacer()
                Text("\(viewModel.wins)")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
            }
            HStack {
                Text("Losses:")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                Spacer()
                Text("\(viewModel.losses)")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
            }
            HStack {
                Text("Draws:")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                Spacer()
                Text("\(viewModel.draws)")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(viewModel: ScoreViewModel.shared)
    }
}
