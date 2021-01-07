//
//  Person.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation

class Person {
    private var hand: [Card] = []
    
    public func getNewCard(card: Card) {
        hand.append(card)
    }
    
    public func removeAllCards() {
        hand.removeAll()
    }
    
    public func getMyHand() -> [Card] {
        return hand
    }
}
