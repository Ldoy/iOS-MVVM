//
//  CardGameModel.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/28.
//

import Foundation

//MARK: -Model
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCard: Int, creatCardContent: (Int) -> CardContent) {
        self.cards = [Card]()
        for pairIndex in 1...numberOfPairsOfCard {
            let content = creatCardContent(pairIndex)

            self.cards.append(Card(content: content, id: pairIndex * 2))
            
            self.cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    
    mutating func choose(_ card: Card) {
        let cardIndex = self.index(of: card)
        self.cards[cardIndex].isFaceUp.toggle()
        print(#function, card.isFaceUp)
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return .zero
    }
    
    struct Card: Identifiable {
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
