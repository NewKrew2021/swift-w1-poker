//
//  main.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/06.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

let numofplayer = 3
let numberofcard = 5

let card = CardDeck.init()
let game = Game(numofplayer: numofplayer)

game.shareCard(numberofcard: numberofcard, cardDeck: card)
print("\(numberofcard)카드 기준, 참가자 \(numofplayer)명 일 때\n")
game.description()
