//
//  ContentView.swift
//  DiceGame
//
//  Created by Frida Dahlqvist on 2024-04-09.
//

import SwiftUI

struct ContentView: View {
    
    @State var diceNumber1 = 1
    @State var diceNumber2 = 2
    
    @State var sum = 0

    
    
    var body: some View {
        ZStack {
            Color(red: 255/256, green: 102/256, blue: 178/256)
                .ignoresSafeArea()
            
            VStack {
                Text ("\(sum)")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                
                HStack {
                    DiceView(n: diceNumber2)
                    DiceView(n: diceNumber1)
                    
                }.onAppear(){
                    newDiceValue()
                }
                
                Button(action: {
                    rollDice()
                }, label: {
                    Text ("Roll")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    
                })
                
                .background(Color.black)
                .cornerRadius(15.0)
                Spacer()
                
                
                Button(action: {
                    resetDices()
                }, label: {
                    Text("Reset")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                })
                .background(Color.black)
                .cornerRadius(15.0)
                Spacer()
            }
        }
    }
    
    func newDiceValue() {
        diceNumber1 = Int.random(in: 1...6)
        diceNumber2 = Int.random(in: 1...6)
        
    }
    
    func rollDice(){
        newDiceValue()
        sum += diceNumber1 + diceNumber2
        
    }
    
    func resetDices(){
        sum = 0
    }
}

struct DiceView : View {
    let n: Int
    var body: some View {
        Image(systemName: "die.face.\(n).fill")
            .resizable()
            .aspectRatio(contentMode:.fit)
            .padding()
    }
}


#Preview {
    ContentView()
}
