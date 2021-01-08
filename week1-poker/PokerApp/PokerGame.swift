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
    
    public var dealer: Dealer
    private var _gamers: [Person]
    public var gamers: [Person] {
        get {
            return _gamers
        }
        set {
            _gamers = newValue
        }
    }
    public var gameType: GameTypes = .FiveCardStud
    private var numOfRequiredCards: Int = 0
    public var canAddPlayer: Bool {
        get {
            return gamers.count >= 5 ? false : true
        }
    }
    public var canPlayGame: Bool {
        get {
            return gamers.count > 1 && dealer.count >= numOfRequiredCards ? true : false
        }
    }
    
    init(dealer: Dealer) {
        self.dealer = dealer
        _gamers = [dealer]
    }
    
    public func addGamer(gamer: Person){
        if canAddPlayer {
            gamers.append(gamer)
        }
    }
    
    public func startGame(){
        switch gameType {
        case .FiveCardStud:
            numOfRequiredCards = 5 * gamers.count
        case .SevenCardStud:
            numOfRequiredCards = 7 * gamers.count
        }
        
        if !canPlayGame {
            return
        }
        
        while canPlayGame {
            removeAllCardsOfGamers()
            switch gameType {
            case .FiveCardStud:
                fiveCardStud()
            default:
                sevenCardStud()
            }
        }
    }
    
    private func sevenCardStud() {
        for _ in 0..<7{
            for gamer in gamers {
                dealer.giveCard(to: gamer)
            }
        }
        showCards()
    }
    
    private func fiveCardStud() {
        for _ in 0..<5{
            for gamer in gamers {
                dealer.giveCard(to: gamer)
            }
        }
        showCards()
    }
    
    private func removeAllCardsOfGamers() {
        for gamer in gamers {
            gamer.removeAllCards()
        }
    }
    
    private func getStatus() -> String {
        var status: String = "[현재 카드 상황]\n\n"
        for gamer in gamers {
            if let player = gamer as? Player {
                status += "플레이어#\(String(player.id))"
            }
            else{
                status += "딜러\t\t "
            }
            status += "\(gamer.getMyHand())\n"
        }
        return status
    }
    
    private func showCards() {
        print(getStatus())
    }
}
