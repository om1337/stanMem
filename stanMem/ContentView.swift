//
//  ContentView.swift
//  stanMem
//
//  Created by Om Nagarkar on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack() {
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
//  @State can scrappily simulate and bypass the immutability
//  Game logic should be stored in a different mechanism
    
    @State var isFaceUp = false
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack() {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
