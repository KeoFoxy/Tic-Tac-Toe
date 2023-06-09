//
//  ControlButtonsView.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 07.06.2023.
//

import SwiftUI
import RiveRuntime

struct ControlButtonsView: View {
    @ObservedObject var controlButtonsModel: ControlButtonsModel

    var body: some View {
        HStack(spacing: 10) {
            CustomButton(title: "Reset Score",
                         systemImage: "eraser.fill",
                         button: RiveViewModel(fileName: "button", autoPlay: false),
                         controlButtonsModel: controlButtonsModel)
        }
    }
}

//struct ControlButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ControlButtonsView()
//    }
//}

struct CustomButton: View {
    var title: String
    var systemImage: String
    var button: RiveViewModel
    var controlButtonsModel: ControlButtonsModel
    
    var body: some View {
        button.view()
            .frame(width: 200, height: 64)
            .background(
                Color.black
                    .cornerRadius(30)
                    .blur(radius: 15)
                    .opacity(0.15)
                    .offset(y: 4)
            )
            .overlay(
            Label(title, systemImage: systemImage)
                .offset(x: 4, y: 4)
                .font(.custom("Poppins Bold", size: 20, relativeTo: .title))
                
            )
            .onTapGesture {
                //controlButtonsModel.resetScore()
                ScoreViewModel.shared.resetScore()
                button.play(animationName: "active")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation(.spring()){
                        
                    }
                }
            }
    }
}
