//
//  CardGameModel.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/28.
//

import Foundation

//model
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(card: Card) {
        
        print(#function)
    }
    
    struct Card {
        var isFaceUp:Bool
        var isMatched: Bool
        var content: CardContent
    }
}

//viewmodel
class EmojiMemoryGame {
    private(set) var model: MemoryGame<String>?
    
    var cards: [MemoryGame<String>.Card]?
    
    
}
