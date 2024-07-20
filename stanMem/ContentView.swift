//
//  ContentView.swift
//  stanMem
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["😎", "😎", "👻", "👻", "😎", "😎", "😎", "👻", "👻", "😎"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        HStack {
            
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(placedEmoji: emojis[index])
            }
            
        }
        .foregroundColor(.orange)
        .padding()
        
        VStack {
            HStack {
                
                cardRemover
                
                Spacer()
                
                cardAdder
            }
            .imageScale(.large)
            .font(.title2)
            .safeAreaPadding()
        }
        
    }
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "xmark.circle")
            Text("Remove Card")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
            Text("Add Card")
        })
    }
    
}

struct CardView: View {
    
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
