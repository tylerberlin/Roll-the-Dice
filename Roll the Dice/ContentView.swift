//
//  ContentView.swift
//  Roll the Dice
//
//  Created by Tyler Berlin on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var randomValue = 0
    @State var rotation = 0.0
    var body: some View {
        VStack {
            Text("Dice Roll")
                .font(.title)
            Image ("pips \(randomValue)")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
                .onTapGesture {
                    chooseRandom(times: 3)
                    withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)){
                        rotation += 360
                    }
                }
                .rotationEffect(.degrees(rotation))
                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                Spacer()
            }
        }
        
        func chooseRandom(times:Int){
            if times > 0{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
                }
            }
        }
    }
                                      
    #Preview {
        ContentView()
    }
