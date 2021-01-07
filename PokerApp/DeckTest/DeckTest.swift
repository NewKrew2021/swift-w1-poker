//
//  DeckTest.swift
//  DeckTest
//
//  Created by 이청원 on 2021/01/07.
//

import XCTest

class DeckTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResetDeck() throws {
        var deck = Deck()
        deck.reset()
        XCTAssertEqual(deck.count(), 53)
    }
    
    func testShuffle() throws {
        var deck = Deck()
        deck.shuffle()
    }
    
    func testRemoveOne() throws {
        var deck = Deck()
        let cnt = deck.count()
        let _ = deck.removeOne()
        XCTAssertEqual(deck.count(), cnt - 1)
    }
}
