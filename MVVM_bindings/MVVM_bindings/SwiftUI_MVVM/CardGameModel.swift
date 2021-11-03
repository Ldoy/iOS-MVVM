//
//  CardGameModel.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/28.
//

import Foundation

//model
struct MemoryGame<CardContent> {
    //카드를 가지고 있어요. 데이터
    private(set) var cards: Array<Card>
    
    //카드 얼만큼 만들지 정해줘요.
    init(numberOfPairsOfCard: Int, creatCardContent: (Int) -> CardContent) {
        self.cards = [Card]()
        for pairIndex in 1...numberOfPairsOfCard {
            let content = creatCardContent(pairIndex)

            self.cards.append(Card(content: content,
                                   id: pairIndex * 2))
            
            self.cards.append(Card(content: content,
                                   id: pairIndex * 2 + 1))
        }
    }

    mutating func choose(_ card: Card) {
        var cardIndex = self.index(of: card)
        
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
        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
            if lhs.id == rhs.id {
                return true
            }
            return false
        }
        func hash(into hasher: inout Hasher) {
            
        }

        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
