//
//  ViewModel.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/28.
//

import Foundation

//MARK: -View Model

class EmojiMemoryGame: ObservableObject {
    static let imojis = ["๐", "๐", "๐", "๐งก", "๐ฅฒ", "๐", "๐", "๐ฅ"]
    
    static private func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 5) { index in
            EmojiMemoryGame.imojis[index]
        }
    }

    @Published private var model = creatMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    //MARK: -Intent
    func choose(_ card: MemoryGame<String>.Card) {
        
        model.choose(card)
    }
}
