//
//  Colors.swift
//  Tic-Tac-Toe
//
//  Created by Alexander Sorokin on 04.06.2023.
//

import SwiftUI

    // Colors
let lightBlue:Color = Color(hex: "#AEE4FF")
let oceanBlue: Color = Color(hex: "#ADC0FF")
let daskBlue: Color = Color(hex: "#6A9CFD")
let piggiPink: Color = Color(hex: "#FFB8D0")
let skinPalePink: Color = Color(hex: "#FEE5E1")
let lemonYellow: Color = Color(hex: "#FFE2A0")
let peachRed: Color = Color(hex: "#FFA0A0")

let customRedColor: Color = Color(red: 232/255, green: 69/255, blue: 69/255)
let customMagentaColor: Color = Color(red: 226/255, green: 109/255, blue: 246/255)
let customCyanColor: Color = Color(red: 177/255, green: 252/255, blue: 248/255)
let customYellowColor: Color = Color(red: 253/255, green: 237/255, blue: 140/255)
let customPurpleColor: Color = Color(red: 77/255, green: 31/255, blue: 182/255)
let customLightBlueColor: Color = Color(red: 105/255, green: 226/255, blue: 246/255)
let customPaleYellowColor: Color = Color(red: 179/255, green: 177/255, blue: 149/255)
let customPaleRedColor: Color = Color(red: 224/255, green: 118/255, blue: 129/255)

let MoonLight: Color = Color("Moon Light")
let Fuchsia: Color = Color("Fuchsia")
let SkyBlue: Color = Color("SkyBlue")
let SkyPurple: Color = Color("Sky Purple")
let PaleYellow: Color = Color("Pale Yellow")
let PeachOrange: Color = Color("Peach Orange")

// Gradients
let daySky = LinearGradient(colors: [daskBlue, lightBlue],
                                              startPoint: .top,
                                              endPoint: .bottom)

let dawnSky = LinearGradient(colors: [.black, .gray],
                                              startPoint: .top,
                                              endPoint: .bottom)


let FieldBackground = LinearGradient(colors: [PaleYellow, PeachOrange], 
                                              startPoint: .topLeading, 
                                              endPoint: .bottomTrailing)

var AngGradietn: some View {
    AngularGradient(gradient: Gradient(colors: [ customRedColor, customMagentaColor, customCyanColor, customYellowColor, customRedColor ]), 
                                              center: .center, 
                                              angle: .degrees(120)).ignoresSafeArea()
}

var LinGradient: some View {
    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(1)]), 
                                              startPoint: .bottom, 
                                              endPoint: .top).ignoresSafeArea()
}
