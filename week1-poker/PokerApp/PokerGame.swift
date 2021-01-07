//
//  PokerGame.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation

class Poker {
    enum GameTypes {
        case SevenCardStud, FiveCardStud
    }
    
    private var dealer: Dealer
    private var players: [Player] = []
    private var gameType: GameTypes = .FiveCardStud
    private var numOfRequiredCards : Int = 0
    
    init(dealer: Dealer) {
        self.dealer = dealer
    }
    
    public func setDealer(dealer: Dealer) {
        self.dealer = dealer
    }
    
    public func setGameType(gameType: GameTypes) {
        self.gameType = gameType
    }
    
    public func addPlayer(player: Player) -> Bool {
        if canAddPlayer() {
            players.append(player)
            return true
        }
        return false
    }
    
    private func canAddPlayer() -> Bool {
        return players.count >= 4 ? false : true
    }
    
    public func startGame() -> Bool {
        switch gameType {
        case .FiveCardStud:
            numOfRequiredCards += 5
        case .SevenCardStud:
            numOfRequiredCards += 7
        }
        
        if !canPlayGame() {
            return false
        }
        
        while canPlayGame() {
            removeAllCardsOfPlayers()
            switch gameType {
            case .FiveCardStud:
                fiveCardStud()
            default:
                sevenCardStud()
            }
        }
        
        return (53 - dealer.count) % numOfRequiredCards == 0 ? true : false
    }
    
    private func canPlayGame() -> Bool {
        return isPlayerExist() && dealer.count >= numOfRequiredCards ? true : false
    }
    
    private func isPlayerExist() -> Bool {
        return players.count > 0 ? true : false
    }
    
    private func sevenCardStud() {
        for _ in 0..<7{
            for player in players {
                dealer.giveCard(to: player)
            }
            dealer.giveCard(to: dealer)
        }
        showCards()
    }
    
    private func fiveCardStud() {
        for _ in 0..<5{
            for player in players {
                dealer.giveCard(to: player)
            }
            dealer.giveCard(to: dealer)
        }
        showCards()
    }
    
    private func removeAllCardsOfPlayers() {
        for player in players {
            player.removeAllCards()
        }
        dealer.removeAllCards()
    }
    
    private func getStatus() -> String {
        var status: String = "[현재 카드 상황]\n\n"
        for player in players {
            status += "플레이어#\(String(player.id)) \(player.getMyHand())\n"
        }
        status += "딜러\t\t \(dealer.getMyHand())\n"
        return status
    }
    
    private func showCards() {
        print(getStatus())
    }
}
