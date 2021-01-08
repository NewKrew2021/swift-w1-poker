//
//  Game.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/07.
//

import Foundation

struct Game {
    
    private var deck = Deck()
    private var players = [Player]()
    private let output = Output()
    private let input = Input()
    
    func getCardAndPlayerCount() -> (Int, Int) {
        let cardNum = input.inputChooseCard()
        let playerNum = input.inputChoosePlayer()
        return (cardNum, playerNum)
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
    
    func startGame() {
        var maxScore : Float = 0
        for player in players {
            maxScore = max(maxScore, player.getScore())
        }
        output.printHand(players: self.players, maxScore: maxScore)
    }
}
