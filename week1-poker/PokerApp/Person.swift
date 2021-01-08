//
//  Person.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation

class Person {
    private var _hand: [Card] = []
    public var hand: [Card] {
        get{
            return _hand
        }
        set {
            _hand = newValue
        }
    }
    
    public func getNewCard(card: Card) {
        hand.append(card)
    }
    
    public func removeAllCards() {
        hand.removeAll()
    }
    
    public func getMyHand() -> String {
        var myHand: String = "["
        for card in hand {
            myHand += String(describing: card) + ", "
        }
        myHand.removeLast()
        myHand.removeLast()
        myHand += "]"
        return myHand
    }
}
