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
        dealer.deck.reset()
        dealer.deck.shuffle()
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
        calculateScore()
        showCards()
    }
    
    private func fiveCardStud() {
        for _ in 0..<5{
            for gamer in gamers {
                dealer.giveCard(to: gamer)
            }
        }
        calculateScore()
        showCards()
    }
    
    private func removeAllCardsOfGamers() {
        for gamer in gamers {
            gamer.removeAllCards()
        }
    }
    
    private func calculateScore() {
        for gamer in gamers {
            gamer.score = PokerScoreMachine.getScore(hand: gamer.hand)
        }
    }
    
    private func getStatus() -> String {
        var status: String = "[현재 카드 상황]\n\n"
        var maxScore = 0
        for gamer in gamers {
            maxScore = max(maxScore, gamer.score)
        }
        
        for gamer in gamers {
            if let player = gamer as? Player {
                status += "플레이어#\(String(player.id))"
            }
            else{
                status += "딜러\t\t"
            }
            status += " \(gamer.getMyHand())"
            
            if gamer.score == maxScore {
                status += "\t <= 승자"
            }
            status += "\n"
        }
        return status
    }
    
    private func showCards() {
        print(getStatus())
    }
}


class PokerScoreMachine {

    static var cardCount = [Int](repeating: 0, count: 14)
    static var haveJoker = false
    
    static func getScore(hand: [Card]) -> Int{
        getRankArr(hand: hand)
        var score = 0
        score = max(scoreIfFourCard(), scoreIfTriple(), scoreIfStraight(), scoreIfTwoPair(), scoreIfOnePair())
        if score == 0 {
            if let val = cardCount.lastIndex(of: 1) {
                score = val * 10
            }
        }
        return score
    }
    
    public static func getRankArr(hand: [Card]) {
        cardCount = [Int](repeating: 0, count: 14)
        haveJoker = false
        for card in hand {
            if let rank = card.rank {
                cardCount[rank.rawValue] += 1
            }
            else{
                haveJoker = true
            }
        }
    }
    
    public static func scoreIfFourCard() -> Int {
        var score = 0
        if let maxCnt = cardCount.max() {
            if maxCnt <= 2 || (maxCnt == 3 && !haveJoker){
                return score
            }
            
            score += 5000
            if let idx = cardCount.lastIndex(of: maxCnt) {
                score += idx * 10
            }
            
            if maxCnt == 3{
                score -= 1
            }
        }
        return score
    }
    
    public static func scoreIfStraight() -> Int {
        var score = 0
        var sequenceCount = 0
        var maxSeqCnt = 0
        var maxSeqPos = 0
        
        for i in cardCount.indices {
            let count = cardCount[i]
            if count == 0 {
                sequenceCount = 0
            }
            else {
                sequenceCount += 1
            }
            if maxSeqCnt <= sequenceCount {
                maxSeqCnt = sequenceCount
                maxSeqPos = i
            }
        }
        
        if maxSeqCnt <= 3 || (maxSeqCnt == 4 && !haveJoker) {
            return score
        }
        
        score += 4000
        
        if maxSeqCnt == 5{
            score += maxSeqPos * 10
        }
        else {
            score += (maxSeqPos == 13 ? maxSeqPos : maxSeqPos + 1) * 10
            score -= 1
        }
        return score
    }
    
    public static func scoreIfTriple() -> Int {
        var score = 0
        if let maxCnt = cardCount.max() {
            if maxCnt <= 1 || (maxCnt == 2 && !haveJoker) {
                return score
            }
            
            score += 3000
            let idxOfTriple = cardCount.lastIndex(of: 3) ?? -1
            let idxOfPair = cardCount.lastIndex(of: 2) ?? -1
            
            if haveJoker && idxOfPair > idxOfTriple {
                score += idxOfPair * 10
                score -= 1
            }
            else {
                score += idxOfTriple * 10
            }
        }
        return score
    }
    
    public static func scoreIfTwoPair() -> Int {
        var score = 0
        if let maxCnt = cardCount.max() {
            if maxCnt == 1 {
                return 0
            }
            
            let idxOfPair = cardCount.lastIndex(of: maxCnt) ?? -1
            
            score += 2000
            
            if haveJoker {
                if let idxOfHigh = cardCount.lastIndex(of: 1) {
                    if idxOfHigh > idxOfPair {
                        score += idxOfHigh * 10
                    }
                    else{
                        score += idxOfPair * 10
                    }
                    score -= 1
                }
            }
            else if let idxOfPairFirst = cardCount.firstIndex(of: maxCnt) {
                if idxOfPair == idxOfPairFirst {
                    return 0
                }
                score += idxOfPair * 10
            }
        }
        
        return score
    }
    
    public static func scoreIfOnePair() -> Int {
        var score = 0
        if let maxCnt = cardCount.max() {
            if maxCnt == 1 && !haveJoker {
                return 0
            }
            
            score += 1000
            if maxCnt == 1 {
                if let idxOfHigh = cardCount.lastIndex(of: 1) {
                    score += idxOfHigh * 10
                    score -= 1
                }
            }
            else if let idxOfPair = cardCount.lastIndex(of: 2) {
                score += idxOfPair * 10
            }
        }
        return score
    }
}
