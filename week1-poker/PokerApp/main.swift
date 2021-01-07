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


class Card : Equatable{
    private let shape: CardShape
    private let rank: String
    //카드덱에서 객체 만드는 것을 간편하게 하기위해 사용
    private let CardRanks = ["", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    public init(shape: CardShape, rank: Int){
        self.shape = shape
        self.rank = CardRanks[rank]
    }
    
    public func getInfo() -> String {
        let info: String = "\(shape.rawValue)\(rank)"
        return info
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.shape == rhs.shape
    }
}

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

var h12 = Card(shape: .hearts, rank: 12)
var s7 = Card(shape: .spades, rank: 7)
let deck = Deck()


print(deck.reset())
print(h12.getInfo())
print(s7.getInfo())


