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
        for pairIndex in 0...numberOfPairsOfCard {
            let content = creatCardContent(pairIndex)

            self.cards.append(Card(content: content, id: pairIndex * 2))
            self.cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
//    func choose(card: Card) {
//        print(#function)
//    }
    
    // 카드의 상태 여기서 보고 있음
    struct Card: Hashable {
        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
            if lhs.id == rhs.id {
                return true
            }
            return false
        }
        func hash(into hasher: inout Hasher) {
            
        }

        //var id: ObjectIdentifier
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
