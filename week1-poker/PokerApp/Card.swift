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

enum CardRank: Int, CaseIterable  {
   case one = 1, two , three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
}

class Card : Equatable{
    public let shape: CardShape
    public let rank: CardRank?
    
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
            switch ran.rawValue {
            case 1:
                desc += "A"
            case 11:
                desc += "J"
            case 12:
                desc += "Q"
            case 13:
                desc += "K"
            default:
                desc += String(ran.rawValue)
            }
        }
        return desc
    }
}
