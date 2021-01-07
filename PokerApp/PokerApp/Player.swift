//
//  Player.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/07.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

class Player {
    var cards : [Card]
    private var playerID : Int

    init(id : Int) {
        self.cards = []
        self.playerID = id
    }
    
    func addCard(card : Card){
        self.cards.append(card)
    }
    func count() -> Int{
        return self.cards.count
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
    
    func description() {
        for i in 0..<self.players.count {
            if i != self.players.count - 1 {
                print("참가자#\(i + 1) \(self.players[i].description)")
                
            }
            else { print("딜러 \(self.players[i].description)") }
        }
    }
}

