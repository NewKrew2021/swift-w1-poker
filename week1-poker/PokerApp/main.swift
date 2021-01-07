//
//  main.swift
//  week1-poker
//
//  Created by 윤준수 on 2021/01/06.
//

import Foundation

var h12 = Card(shape: .hearts, rank: 12)
var s7 = Card(shape: .spades, rank: 7)
let deck = Deck()


print(h12.getInfo())
print(s7.getInfo())

deck.shuffle()

if let card = deck.removeOne() {
    print(card.getInfo())
}


