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

enum CardRank: String, CaseIterable {
   case one = "A", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", eleven = "J", twelve = "Q", thirteen = "K"
}

class Card : Equatable{
    private let shape: CardShape
    private let rank: CardRank?
    
    public init(shape: CardShape, rank: CardRank?){
        self.shape = shape
        self.rank = rank
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.shape == rhs.shape
    }
}

extension Card : CustomStringConvertible {
    var description: String {
        var desc: String = String(shape.rawValue)
        if let ran = rank {
            desc += ran.rawValue
        }
        return desc
    }
}
