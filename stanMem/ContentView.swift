//
//  ContentView.swift
//  stanMem
//
//  Created by Om Nagarkar on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let emojis: Array<String> = ["😎", "😎", "👻", "👻"]
//      let emojis: [String] = ["😎", "😎", "👻", "👻"]
        
        HStack() {
//          ForEach(0...4,) // Up to 4, including
//          ForEach(0..<4,) // Up to 4, not including
            
            ForEach(0..<4, id: \.self) { index in
                CardView(placedEmoji: emojis[index])
            }
            
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
//  @State can scrappily simulate and bypass the immutability
//  Game logic should be stored in a different mechanism
    
    @State var isFaceUp = false
    let placedEmoji: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack() {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(placedEmoji).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            print("tapped")
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
    
}









#Preview {
    ContentView()
}
