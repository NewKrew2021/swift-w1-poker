//
//  Game.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/07.
//

import Foundation

struct Game {
    enum Input : String {
        case card = "카드의 개수를 입력해주세요(5 / 7)\n >>"
        case player = "참가자의 수를 입력해주세요(1 ~ 4)\n >>"
        case error = "잘못된 입력입니다."
    }
    
    private var deck = Deck()
    private var players = [Player]()
    
    func input() -> (Int, Int) {
        let cardNum = chooseCard()
        let playerNum = choosePlayer()
        return (cardNum, playerNum)
    }
    
    private func chooseCard() -> Int {
        print(Input.card.rawValue, terminator:"")
        let cardNum : Int? = Int(readLine() ?? "") ?? 0
        if (cardNum == 5 || cardNum == 7) {
            return cardNum ?? 5
        } else {
            print(Input.error.rawValue)
            return chooseCard()
        }
    }
    
    private func choosePlayer() -> Int {
        print(Input.player.rawValue, terminator:"")
        let playerNum : Int? = Int(readLine() ?? "") ?? 0
        if ((playerNum ?? 0) >= 1 && (playerNum ?? 0) <= 4) {
            return playerNum ?? 1
        } else {
            print(Input.error.rawValue)
            return choosePlayer()
        }
    }
    
    mutating func makePlayer(playerNum:Int) {
        for i in 1...playerNum {
            self.players.append(Participant(playerNum: i))
        }
        self.players.append(Dealer())
    }
    
    mutating func giveCard(cardNum: Int) {
        self.deck.reset()
        self.deck.shuffle()
        for i in self.players {
            i.removeHand()
            for _ in 0..<cardNum {
                i.getCard(card: deck.removeOne() ?? Card(shape: .joker, number: .joker))
            }
        }
    }
    
    func printHand() {
        for player in players {
            print("\(player) \(player.getHandString())")
        }
    }
    
    func playerCount() -> Int {
        return self.players.count
    }
    
    func playerHandCount(index : Int) -> Int {
        if index >= playerCount() {
            return -1
        } else {
            return self.players[index].handCount()
        }
    }
}
