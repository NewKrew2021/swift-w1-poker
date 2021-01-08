//
//  Jokbo.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/08.
//

import Foundation

struct Jokbo {
    enum JokboType : Int {
        case high = 0, onePair, twoPair, triple, straight, fourCard
    }
    
    private let jokboType : JokboType
    private let highestNum : Int
    private let secondHighestNum : Int
    private let highestShape : Int
    private let joker : Bool
    
    init(jokboType:JokboType, highestNum:Int, secondHighestNum:Int, highestShape:Int, joker:Bool) {
        self.jokboType = jokboType
        self.highestNum = highestNum
        self.secondHighestNum = secondHighestNum
        self.highestShape = highestShape
        self.joker = joker
    }
}
