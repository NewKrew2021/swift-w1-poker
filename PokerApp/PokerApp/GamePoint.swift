//
//  GamePoint.swift
//  PokerApp
//
//  Created by 이준형 on 2021/01/08.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

class PokerPoint {

    init() {}
    
    func checkForCards(person : Player){
        let cards = person.cards
        var cardDic : [Int:[Int]] = [:]
        for card in cards {
            if cardDic[card.number.rawValue] == nil {
                cardDic[card.number.rawValue] = [card.shape.rawValue]
            }
            else {
                cardDic[card.number.rawValue]?.append(card.shape.rawValue)
            }
        }
        let sortDic = cardDic.sorted { $0.1.count > $1.1.count }
        
        switch sortDic[0].value.count {
            case 2 :
                person.type = .OnePair
            case 3 :
                person.type = .Thrips
            case 4 :
                person.type = .Quads
            default:
                person.type = .Null
        }
        person.rank = sortDic[0].key
        person.suit = sortDic[0].value
    }
    
    
    func calculatePokerPoint(persons : [Player]) -> Player {
        for person in persons {
            checkForCards(person: person)
        }
        var TopPerson : Player = persons[0]
        for i in 0..<persons.count {
            for j in i..<persons.count {
                if i==j { continue }
                if !TopPerson.comparePoint(person: persons[i]){
                    TopPerson = persons[i]
                }
            }
        }
        return TopPerson
    }
    
}
