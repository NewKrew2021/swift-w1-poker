//
//  Participant.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/07.
//

import Foundation

class Participant : Player {
    private var playerNum : Int
    
    init(playerNum: Int) {
        self.playerNum = playerNum
    }
    
    override var description: String {
        return "참가자#\(self.playerNum)"
    }
}
