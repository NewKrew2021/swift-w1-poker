//
//  Player.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/07.
//

import Foundation

class Player : CustomStringConvertible {
    private var hand = [Card]()
    
    func removeHand() {
        hand.removeAll()
    }
    
    func getCard(card:Card) {
        hand.append(card)
    }
    
    var description: String {
        return ""
    }
    
    func getHandString() -> String {
        var str = "["
        for i in 0..<hand.count {
            if i == hand.count - 1 {
                str += "\(hand[i])]"
            } else {
                str += "\(hand[i]), "
            }
        }
        return str
    }
    
    func handCount() -> Int {
        return self.hand.count
    }
}
