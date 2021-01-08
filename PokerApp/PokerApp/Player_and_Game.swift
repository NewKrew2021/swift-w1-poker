//
//  Player.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/07.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

class Player {
    enum PointType: Int {
        case Null = 0, OnePair, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, StraightFlush
        static let pointType = [Null, OnePair, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, StraightFlush]
    }
    
    var cards : [Card]
    var playerID : Int
    var type : PointType
    var rank : Int
    var suit : [Int]
    
    init(id : Int) {
        self.cards = []
        self.playerID = id
        self.type = .Null
        self.rank = 0
        self.suit = []
        
    }
    
    func addCard(card : Card){
        self.cards.append(card)
    }
    func count() -> Int{
        return self.cards.count
    }
    
    
    func comparePoint(person : Player) -> Bool {
        if self.type.rawValue > person.type.rawValue { return true }
        else if self.type.rawValue < person.type.rawValue { return false }
        else {
            if self.rank > person.rank { return true }
            else if self.rank < person.rank { return false }
            else {
                if self.suit[0] > person.suit[0] { return true }
                else  { return false }
            }
        }
    }
    var printPoint : String {
        return "\(self.type) \(self.rank) \(self.suit)"
    }
    
    var description : String {
        var str : String = ""
        str.append("[")
        for i in 0..<count(){
            str.append(self.cards[i].description)
            if i == count() - 1 {
                str.append("]")
            }
            else{
                str.append(", ")
            }
                
        }
        return str
    }
}

class Game {
    private var players = [Player]()
    private var best = Player(id:100)
    init(numofplayer : Int){
        for i in 0...numofplayer {
            self.players.append(Player.init(id : i + 1))
        }
    }
    
    func shareCard(numberofcard : Int, cardDeck : CardDeck){
        for _ in 0..<numberofcard{
            for player in self.players {
                player.addCard(card: cardDeck.removeOne())
            }
            
        }
    }
    
    func countAllPoint(){
        best = PokerPoint.init().calculatePokerPoint(persons: self.players)
    }
    
    func description() {
        self.countAllPoint()
        for i in 0..<self.players.count {
            var str : String
            if self.players[i].playerID == best.playerID { str = " <== 승자" }
            else { str = "" }
            
            if i != self.players.count - 1 {
                print("참가자#\(i + 1) \(self.players[i].description)\(str)")
            }
            else { print("딜러 \(self.players[i].description)\(str)") }
            
            
        }
    }
}

