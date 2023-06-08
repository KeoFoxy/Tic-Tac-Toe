//
//  ControlButtonsView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 07.06.2023.
//

import SwiftUI

struct ControlButtonsView: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }){
                Text("Reset score")
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                    .foregroundColor(.black)
            }
            .padding()
            .background(.white)
            .cornerRadius(35)
        }
    }
}

struct ControlButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtonsView()
    }
}
