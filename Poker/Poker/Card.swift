//
//  Card.swift
//  Poker
//
//  Created by 지현우 on 2021/01/07.
//

import Foundation

struct Card{
    //enum Type case 별 Loop를 위해 CaseIterable 채택
    enum Shape: String, CaseIterable{
        case spade = "♠"
        case club = "♣"
        case heart = "♥"
        case diamond = "♦"
        case joker = "🃏"
    }
    
    
    
    //can't change card's shape and num
    private(set) var shape: Shape
    private(set) var num: CardNum // Joker has not Num
    
    var description: String{
        "\(self.shape.rawValue)\(self.convertNumToString())"
    }
    
    init(shape: Shape, num: CardNum = .joker){
        self.shape = shape
        self.num = num
    }
    
    private func convertNumToString() -> String{
        return num.convertFromNumToString()
    }
    
}

extension Card.Shape: Comparable{
    static func <(lhs: Card.Shape, rhs: Card.Shape) -> Bool{
        lhs.rawValue < rhs.rawValue
    }
}

extension Card: Comparable{
    static func <(lhs: Card, rhs: Card) -> Bool{
        if lhs.num.rawValue != rhs.num.rawValue{
            return lhs.num.rawValue < rhs.num.rawValue
        }else{
            return lhs.shape < rhs.shape
        }
    }
}



