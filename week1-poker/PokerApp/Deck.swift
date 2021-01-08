//
//  Deck.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation

class Deck{
    private(set) var _cards: [Card] = []
    public var cards: [Card] {
        get {
            return _cards
        }
        set {
            _cards = newValue
        }
    }
    
    public var count: Int {
        get {
            cards.count
        }
    }
    
    public init(){
        reset()
    }
    
    public func shuffle() {
        //Knuth
        for i in 0..<count - 1 { // 0 ~ n-2
            let randomIndex = Int.random(in: i..<count)
              
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    public func removeOne() -> Card? {
        return cards.popLast()
    }
    
    public func reset() -> Bool {
        cards.removeAll(keepingCapacity: false)
        for rank in CardRank.allCases {
            cards.append(Card(shape: .clubs, rank: rank))
            cards.append(Card(shape: .spades, rank: rank))
            cards.append(Card(shape: .diamonds, rank: rank))
            cards.append(Card(shape: .hearts, rank: rank))
        }
        cards.append(Card(shape: .joker, rank: nil))
        return count == 53 ? true : false
    }
}
