//
//  main.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/06.
//

import Foundation

var game = Game()
let input : (Int, Int) = game.input()
game.makePlayer(playerNum: input.1)
game.giveCard(cardNum: input.0)
game.printHand()
