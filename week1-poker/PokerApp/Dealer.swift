//
//  Dealer.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation
class Dealer: Person{
    private var deck: Deck = Deck()
    public var count: Int {
        get {
            deck.count()
        }
    }
    
    public func giveCard(to: Person) {
        if let card = deck.removeOne(){
            to.getNewCard(card: card)
        }
    }
}
