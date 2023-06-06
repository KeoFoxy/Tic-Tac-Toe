//
//  Alerts.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 06.06.2023.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win"),
                                    message: Text("Congratulations!"),
                                    buttonTitle: Text("Ok"))
    
    static let AIWin       = AlertItem(title: Text("You lost"),
                                    message: Text("Not today!"),
                                    buttonTitle: Text("Ok"))
    
    static let draw     = AlertItem(title: Text("Draw"),
                                    message: Text("Play onew more!"),
                                    buttonTitle: Text("Ok"))
    
}

struct Alerts: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
