//
//  CardTest.swift
//  CardTest
//
//  Created by 이청원 on 2021/01/07.
//

import XCTest

class CardTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPrintCard() throws {
        let card = Card(shape: .heart, number: .queen).description
        XCTAssertEqual(card, "♥︎Q")
    }
}
