//
//  Deck.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation

class Deck{
    public var cards: [Card] = []
    
    public init(){
        reset()
    }
    
    public func count() -> Int {
        return cards.count
    }
    
    public func shuffle() {
        //Fisher-Yates
//        cards.shuffle()
        
        //Knuth
        for i in 0..<cards.count - 1 { // 0 ~ n-2
            let randomIndex = Int.random(in: i..<cards.count)
              
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    //    public func removeOne(card: Card){
    //
    //    }
    
    public func removeOne() -> Card? {
        return cards.popLast()
    }
    
    public func reset() -> Bool {
        cards.removeAll(keepingCapacity: false)
        for rank in 1...13 {
            cards.append(Card(shape: .clubs, rank: rank))
            cards.append(Card(shape: .spades, rank: rank))
            cards.append(Card(shape: .diamonds, rank: rank))
            cards.append(Card(shape: .hearts, rank: rank))
        }
        cards.append(Card(shape: .joker, rank: 0))
        return cards.count == 53 ? true : false
    }
}
