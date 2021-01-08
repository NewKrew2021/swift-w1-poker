//
//  Player.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/07.
//

import Foundation

class Player : CustomStringConvertible {
    private var hand = Hand()
    private var score : Float = 0
    
    func removeHand() {
        hand.removeAll()
    }
    
    func getCard(card:Card) {
        hand.plusCard(card: card)
    }
    
    var description: String {
        return ""
    }
    
    func getHandString(maxScore:Float) -> String {
        if self.score == maxScore {
            return "\(hand) \(score) <== 승자"
        } else {
            return "\(hand) \(score)"
        }
    }
    
    func handCount() -> Int {
        return self.hand.count()
    }
    
    func getScore() -> Float {
        self.score =  hand.calculateScore()
        return self.score
    }
}
