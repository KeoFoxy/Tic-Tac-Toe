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
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.pink, lineWidth: 1)
                .frame(width: 250, height: 200)
                .foregroundColor(.clear)
                .background(.white) //add cool gradiend
                .blur(radius: 5)
                .cornerRadius(10)
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
