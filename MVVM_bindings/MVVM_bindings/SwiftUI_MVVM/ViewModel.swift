//
//  ViewModel.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/28.
//

import Foundation

//view model
class EmojiMemoryGame {
    static let imojis = ["💙", "💚", "💜", "🧡", "🥲", "👍", "😎", "🔥"]
    
    private func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 5) { index in
            EmojiMemoryGame.imojis[index]
        }
    }
    
    private(set) lazy var model = creatMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
