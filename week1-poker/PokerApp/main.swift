//
//  main.swift
//  week1-poker
//
//  Created by 윤준수 on 2021/01/06.
//

import Foundation

let deck = Deck()

deck.shuffle()

if let card = deck.removeOne() {
    print(card)
}

var player1 = Player(id: 1)
var player2 = Player(id: 2)
var player3 = Player(id: 3)
var player4 = Player(id: 4)
var player5 = Player(id: 5)
var player6 = Player(id: 6)

var dealer = Dealer()

var game = Poker(dealer: dealer)
game.addPlayer(player: player1)
game.addPlayer(player: player2)
game.addPlayer(player: player3)
game.addPlayer(player: player4)

game.startGame()
