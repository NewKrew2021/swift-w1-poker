//
//  main.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/06.
//

import Foundation

class Card : CustomStringConvertible {
  
    public enum Suit : String {
        case Hearts = "♥️", Spades = "♠️", Diamonds = "💎", Clubs = "♣️"
    }
    public enum Rank : Int {
        case A = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, J, Q, K
    }
    enum ValidationError: Error {
        case wrongRankRange
    }
    
    var rank: Int
    var suit: Suit
    
    public init(rank: Int, suit: Suit) throws {
        guard 1...13 ~= rank else {
            throw ValidationError.wrongRankRange
        }
        self.rank = rank
        self.suit = suit
    }
    
    private func convertRank() -> String {
        switch self.rank {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(self.rank)
        }
    }
    
    var description: String {
        return "\(self.suit.rawValue)\(self.convertRank())"
    }
}

var c = try Card(rank: 10, suit: Card.Suit.Clubs)

print(c)
