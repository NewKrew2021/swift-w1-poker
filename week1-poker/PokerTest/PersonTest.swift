//
//  PersonTest.swift
//  PersonTest
//
//  Created by 윤준수 on 2021/01/08.
//

import XCTest

class PersonTest: XCTestCase {
    
    var person: Person = Person()
    
    override func setUpWithError() throws {
        person = Person()
    }
    
    func testGetNewCardSuccess() throws {
        let inputCard = Card(shape: .joker, rank: nil)
        person.getNewCard(card: inputCard)
        XCTAssertEqual(inputCard, person.hand.last)
    }
    
    func testRemoveAllSuccess() throws {
        person.getNewCard(card: Card(shape: .clubs, rank: .eight))
        person.getNewCard(card: Card(shape: .clubs, rank: .nine))
        person.getNewCard(card: Card(shape: .clubs, rank: .thirteen))
        person.getNewCard(card: Card(shape: .spades, rank: .one))
        person.removeAllCards()
        let count = person.hand.count
        XCTAssertEqual(count, 0)
    }
    
    func testGetMyHandSuccess() throws {
        person.getNewCard(card: Card(shape: .spades, rank: .one))
        let hand = "[♠️A]"
        XCTAssertEqual(hand, person.getMyHand())
    }
    
    func testGiveCardSuccess() throws {
        let dealer = Dealer()
        let countBefore = person.hand.count
        dealer.giveCard(to: person)
        let countAfter = person.hand.count
        XCTAssertEqual(countBefore + 1, countAfter)
    }
}
