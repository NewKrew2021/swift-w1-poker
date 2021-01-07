//
//  main.swift
//  week1-poker
//
//  Created by 윤준수 on 2021/01/06.
//

import Foundation

enum CardShape: Character{
    case hearts = "♥️", diamonds = "♦️", spades = "♠️", clubs = "♣️", joker = "🃏"
}
//카드덱에서 객체 만드는 것을 간편하게 하기위해 사용
let CardRanks = ["", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

class Card{
    let shape: CardShape
    let rank: String
    
    public init(shape: CardShape, rank: Int){
        self.shape = shape
        self.rank = CardRanks[rank]
    }
    
    public func getInfo() -> String {
        let info: String = "\(shape.rawValue)\(rank)"
        return info
    }
}

class Deck{
    private var cards: [Card] = []
    
    public init(){
        reset()
    }
    
    public func count() -> Int {
        return cards.count
    }
    
    public func shuffle() {
        cards.shuffle()
    }
    
    //    public func removeOne(card: Card){
    //
    //    }
    
    public func removeOne() -> Card? {
        return cards.popLast()
    }
    
    public func reset() -> Bool {
        cards.removeAll(keepingCapacity: false)
        for rank in 1...12 {
            cards.append(Card(shape: .clubs, rank: rank))
            cards.append(Card(shape: .spades, rank: rank))
            cards.append(Card(shape: .diamonds, rank: rank))
            cards.append(Card(shape: .hearts, rank: rank))
        }
        cards.append(Card(shape: .joker, rank: 0))
        
        return cards.capacity == 53 ? true : false
    }
}

var h12 = Card(shape: .hearts, rank: 12)
var s7 = Card(shape: .spades, rank: 7)

print(h12.getInfo())
print(s7.getInfo())
