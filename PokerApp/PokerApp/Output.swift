//
//  Output.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/08.
//

import Foundation

struct Output {
    enum OutputString : String {
        case chooseCard = "카드의 개수를 입력해주세요(5 / 7)\n >>"
        case choosePlayer = "참가자의 수를 입력해주세요(1 ~ 4)\n >>"
        case chooseInputerror = "잘못된 입력입니다."
    }
    
    func outputChooseCard() {
        print(OutputString.chooseCard.rawValue, terminator:"")
    }
    
    func outputChoosePlayer() {
        print(OutputString.choosePlayer.rawValue, terminator:"")
    }
    
    func outputChooseInputError() {
        print(OutputString.chooseInputerror.rawValue)
    }
    
    func printHand(players: [Player], maxScore:Float) {
        for player in players {
            print("\(player) \(player.getHandString(maxScore: maxScore))")
        }
    }
}
