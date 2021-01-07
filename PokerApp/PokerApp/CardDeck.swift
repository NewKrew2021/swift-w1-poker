//
//  CardDeck.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/07.
//  Copyright © 2021 이준형. All rights reserved.
//


import Foundation

class CardDeck {
    
    private var cards = [Card]()
    private var selectCards = [Card]()
    
    init() {
        for shape in Card.Shapes.shapes {
            for number in Card.Numbers.numbers {
                self.cards.append(Card.init(shape : shape, number : number))
            }
        }
        // print(self.cards.count)
        //print("> 카드 초기화\n카드 전체를 초기화했습니다.\n총 \(self.cards.count)장의 카드가 있습니다.\n\n")
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func shuffle() -> [Card] {
        for i in 0..<cards.count {
            let j: Int = Int.random(in: 0..<self.cards.count)
            if i != j { self.cards.swapAt(i, j)}
        }
        //print("> 카드 섞기\n전체 \(self.cards.count)장의 카드를 섞었습니다.")
        return self.cards
    }
    
    func removeOne() -> Card {
        let removeCard = self.cards.remove(at: Int.random(in: 0..<self.cards.count))
        selectCards.append(removeCard)
        //print("> 카드 하나 뽑기\n\(removeCard.shape)\(removeCard.number)\n총 \(self.cards.count)장의 카드가 남아있습니다.")
        return removeCard 
    }
    
    func reset() -> [Card] {
        //전부 다 지우고 해야할 거 같은데?
        //메모리 생각해볼것
        self.cards = CardDeck().cards
        return self.cards
    }
    
    
}

