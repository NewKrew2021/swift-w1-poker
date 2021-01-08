//
//  Card.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/06.
//

import Foundation

class Card: CustomStringConvertible, Comparable, Equatable {
    
    // 스페이드, 하트 , 다이아, 클로버 네개의 데이터를 열거형으로 정리하기 좋다고 판단해서 enum을 선택하였다.
    enum Shape: Float, CustomStringConvertible, CaseIterable, Comparable, Equatable {
        
        static func < (lhs: Shape, rhs: Shape) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static func == (lhs: Shape, rhs: Shape) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
        case clover = 0.1, heart = 0.2, diamond = 0.3, spade = 0.4, joker = 0.01
        
        var description : String {
            switch self {
            case .joker: return "🃏"
            case .clover: return "♣"
            case .heart: return "♥︎"
            case .diamond: return "♦︎"
            case .spade: return "♠︎"
            }
        }
    }
    
    // 처음엔 (Int, String)형 딕셔너리로 구현을 하려고 했는데 1부터 13이라는 한정된 범위의 데이터이기 때문에 enum으로 구현하였다.
    // enum의 타입을 String으로 하려고 했지만 추후에 카드의 대소비교가 어려울것같아서 Int형으로 두고 CustomStringConvertible이라는 프로토콜을 사용하여
    // 인스턴스를 문자열로 변환해주었다.
    enum Number: Float, CustomStringConvertible, CaseIterable, Comparable, Equatable {
        
        static func < (lhs: Number, rhs: Number) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static func == (lhs: Number, rhs: Number) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, joker
        
        var description : String {
            switch self {
            case .joker: return ""
            case .ace: return "A"
            case .jack: return "J"
            case .queen: return "Q"
            case .king: return "K"
            default: return "\(Int(self.rawValue))"
            }
        }
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return (lhs.number < rhs.number) || (lhs.number == rhs.number && lhs.shape < rhs.shape)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.number < rhs.number
    }
    
    var shape : Shape
    var number : Number
    
    init(shape:Shape, number:Number) {
        self.shape = shape
        self.number = number
    }
 
    var description: String {
        return "\(self.shape)\(self.number)"
    }

}
