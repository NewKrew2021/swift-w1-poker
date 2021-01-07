//
//  DeckTest.swift
//  DeckTest
//
//  Created by 윤준수 on 2021/01/06.
//

import XCTest

class DeckTest: XCTestCase {
    var deck: Deck = Deck()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testDeckReset() throws {
        print("reset Test")
        let result = deck.reset()
        XCTAssertTrue(result)
    }

}
