//
//  Card.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/06.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

class Card {
    var shape : Shapes, number : Numbers
    init (shape : Shapes, number : Numbers){
        self.shape = shape
        self.number = number
    }
    
    // enum이 쓰기 쉬워서..
    enum Shapes : Int {
        case spade = 1, heart, diamond, club
        static let shapes = [spade, heart, diamond, club]
    }
    
    enum Numbers : Int {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        static let numbers = [ace, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen]
    }
    
    func equals(compareCard : Card) -> Bool {
        return ( self.shape == compareCard.shape && self.number == compareCard.number )
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number
    }
    
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue < rhs.number.rawValue
    }
    
    var shapeText : String {
        switch self.shape {
            case .spade:
                return "♠"
            case .heart:
                return "♥"
            case .diamond :
                return "◆"
            case .club:
                return "♣"
        }
        
    }
    
    var numberText : String{
        switch self.number {
            case .ace:
                return  "A"
            case .eleven:
                return "J"
            case .twelve:
                return "Q"
            case .thirteen:
                return "K"
            default:
                return String(self.number.rawValue)
        }
        
    }
    
    var description : String {
        return "\(shapeText)\(numberText)"
    }
}

