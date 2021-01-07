//
//  Card.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
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
