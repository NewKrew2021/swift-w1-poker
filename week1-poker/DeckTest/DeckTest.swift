//
//  DeckTest.swift
//  DeckTest
//
//  Created by 윤준수 on 2021/01/07.
//

import XCTest

class DeckTest: XCTestCase {

    let deck = Deck()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeckReset() throws {
        XCTAssertTrue(deck.reset())
    }

    func testDeskSuffle() throws {
        //test시에만 Deck의 cards를 public으로 사용
        let cards = deck.cards
        deck.shuffle()
        XCTAssertNotEqual(cards, deck.cards)
    }
    
    func testCount() throws {
        //test시에만 Deck의 cards를 public으로 사용
        XCTAssertEqual(deck.cards.count, deck.count())
    }
    
    func testCountAfterRemoveOne() throws {
        deck.removeOne()
        XCTAssertEqual(deck.cards.count, deck.count())
    }
    
    func testCountWithNoCards() throws {
        for _ in 0..<deck.count(){
            deck.removeOne()
        }
        XCTAssertEqual(0, deck.count())
    }
    
    func testRemoveOneSuccess() throws {
        let card = deck.removeOne()
        XCTAssertNotNil(card)
    }
    
    func testRemoveOneFail() throws {
        for _ in 0..<deck.count(){
            deck.removeOne()
        }
        let card = deck.removeOne()
        XCTAssertNil(card)
    }
}
