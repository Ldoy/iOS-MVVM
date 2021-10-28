//
//  SwiftUIView.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import SwiftUI

//컨텐트 뷰 만들 때마다 이모지메모리게임을 전달해 주고 싶다.
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewmodel: game)
        }
    }
}

struct ContentView: View {
    let viewmodel: EmojiMemoryGame
    @State var imojiCount = 0
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    //Generic struct 'ForEach' requires that 'MemoryGame<String>.Card' conform to 'Hashable'
                    // Card에 Identifiable 프로토콜 채택
                    ForEach(viewmodel.cards,
                            id: \.self,
                            content: { cards in
                                CardView(card: cards).aspectRatio(2/3, contentMode: .fit)
                        }
                    )
                }
            }
            Spacer()
            HStack(alignment: .center, spacing: 41) {
                addButton
                Text("Shuffle")
                removeButton
            }
            .padding(.horizontal)
        }.font(.largeTitle)
    }
    
    var removeButton: some View {
        Button {
            if imojiCount > 0 {
                imojiCount -= 1
                print(imojiCount)
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        
    }
    
    var addButton: some View {
        Button {
                imojiCount += 1
                print(imojiCount)
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
}

struct CardView: View {
   // @State var isFaceUp: Bool = true
    
    //모델의 카드를 전달. 이렇게 전달하는게 좋다. 필요한 것만 전달하기
    let card: MemoryGame<String>.Card
    //let content: String

    var body: some View {
        let rectangleShape = RoundedRectangle(cornerRadius: 25.0)
        
        ZStack(alignment: .center) {
            // viewBuilder
            if card.isFaceUp {
                rectangleShape
                    .fill()
                    .foregroundColor(.white)
                rectangleShape                .strokeBorder(lineWidth: 8)
                    .foregroundColor(.blue)
                Text(card.content)
            } else {
                rectangleShape                .fill()
                    .foregroundColor(.blue)
            }
            
        }
//        .onTapGesture {
//            isFaceUp = !isFaceUp
//        }
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
