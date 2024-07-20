//
//  ContentView.swift
//  stanMem
//

// implicit returns on one line of code for component views

import SwiftUI

struct ContentView: View {
    
    // Data Logic
    let emojis = ["😎", "😎", "👻", "👻", "😎", "😎", "😎", "👻", "👻", "😎"]
    
    @State var cardCount: Int = 4
    
    
    // UI Body Render
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountHandlers
        }
        
    }
    
    
    // Component Views
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(placedEmoji: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    // // Card Remover & Adder Buttons
    var cardCountHandlers: some View {
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
    
    func cardCountAdjuster(by offset: Int, symbol: String, label: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
            Text(label)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    // // Card Remover Button
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "xmark.circle", label: "Remove card")
    }
    
    // // Card Adder Button
    var cardAdder: some View {
//        Button(action: {
//            if cardCount < emojis.count {
//                cardCount += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//            Text("Add Card")
//        })
        
        cardCountAdjuster(by: +1, symbol: "plus.circle", label: "Add card")
    }
    
}

//
struct CardView: View {
    
    @State var isFaceUp = false
    let placedEmoji: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack() {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(placedEmoji).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
