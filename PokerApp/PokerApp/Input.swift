//
//  Input.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/08.
//

import Foundation

struct Input {
    
    let output = Output()
    
    func inputChooseCard() -> Int {
        output.outputChooseCard()
        let cardNum : Int? = Int(readLine() ?? "") ?? 0
        if (cardNum == 5 || cardNum == 7) {
            return cardNum ?? 5
        } else {
            output.outputChooseInputError()
            return inputChooseCard()
        }
    }
    
    func inputChoosePlayer() -> Int {
        output.outputChoosePlayer()
        let playerNum : Int? = Int(readLine() ?? "") ?? 0
        if ((playerNum ?? 0) >= 1 && (playerNum ?? 0) <= 4) {
            return playerNum ?? 1
        } else {
            output.outputChooseInputError()
            return inputChoosePlayer()
        }
    }
}
