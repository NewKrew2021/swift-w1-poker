//
//  Deck.swift
//  Poker
//
//  Created by 지현우 on 2021/01/07.
//

import Foundation

//상속이 필요없기에 struct로 구현
struct Deck{
    private var cardDeck: [Card] = []
    
    var count: Int{
        cardDeck.count
    }
    
    init(){
        _ = initCardDeck()
    }
    
    mutating func initCardDeck() -> Self{
        self.cardDeck.removeAll()
        for shape in Card.Shape.allCases{
            if shape == .joker{
                continue
            }
            for cardNum in CardNum.allCases{
                if cardNum == .joker{
                    continue
                }
                self.cardDeck.append(Card(shape: shape, num: cardNum))
            }
        }
        
        self.cardDeck.append(Card(shape: .joker, num: .joker))
        
        return shuffleDeck()
    }
    
    mutating func shuffleDeck() -> Self{
        self.cardDeck.shuffle()
        return self
    }
    
    mutating func removeOne() -> Card?{
        let cardOnTop = cardDeck.removeFirst()
        
        return count > 0 ? cardOnTop : nil
    }
    
    mutating func resetDeck() -> Self{
        cardDeck.removeAll()
        _ = initCardDeck()
        return self
    }
    
}
