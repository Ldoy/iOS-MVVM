//
//  SwiftUIView.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import SwiftUI

//컨텐트 뷰 만들 때마다 이모지메모리게임을 전달해 주고 싶다.
//@main
//struct MemorizeApp: App {
//    let game = EmojiMemoryGame()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(game)
//        }
//    }
//}

//MARK:- View
struct ContentView: View {
    @ObservedObject var viewmodel: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewmodel.cards,
                            content: { cards in
                                CardView(card: cards).aspectRatio(2/3, contentMode: .fit)
                                    .onTapGesture {
                                        viewmodel.choose(cards)
                                    }
                        }
                    )
                }
            }
        }.font(.largeTitle)
         .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        let rectangleShape = RoundedRectangle(cornerRadius: 25.0)
        
       ZStack(alignment: .center) {
            if card.isFaceUp {
                rectangleShape
                    .fill()
                    .foregroundColor(.white)
                rectangleShape
                    .strokeBorder(lineWidth: 8)
                    .foregroundColor(.blue)
                Text(card.content)
            } else {
                rectangleShape
                    .fill()
                    .foregroundColor(.blue)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewmodel: game)
            .preferredColorScheme(.dark)
        ContentView(viewmodel: game)
            .preferredColorScheme(.light)
    }
}
