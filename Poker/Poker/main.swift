//
//  main.swift
//  Poker
//
//  Created by 지현우 on 2021/01/06.
//

import Foundation


let table = GameTable(numberOfCard: .fiveCards)
table.enterPlayerInGame(Player(name: "a", money: 10000))
table.enterPlayerInGame(Player(name: "b", money: 10000))
table.enterPlayerInGame(Player(name: "c", money: 10000))

table.startNewGame()
print("승자 : \(table.winnerOfGame())")
