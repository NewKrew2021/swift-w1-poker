//
//  GameTest.swift
//  GameTest
//
//  Created by 이청원 on 2021/01/08.
//

import XCTest

class GameTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInput() throws {
        let game = Game()
        let result = game.input()
        var bool = true
        if !(result.0 == 5 || result.0 == 7) {
            bool = false
        }
        if !(result.1 == 1 || result.1 == 2 || result.1 == 3 || result.1 == 4) {
            bool = false
        }
        XCTAssertTrue(bool)
    }
    
    func testMakePlayer() throws {
        var game = Game()
        let participantCount = Int.random(in: 1...4)
        game.makePlayer(playerNum: participantCount)
        XCTAssertEqual(game.playerCount(), participantCount + 1)
    }
    
    func testGiveCard() throws {
        var game = Game()
        var bool = true
        game.makePlayer(playerNum: Int.random(in: 1...4))
        let playerCount = game.playerCount()
        game.giveCard(cardNum: 5)
        for index in 0..<playerCount {
            if game.playerHandCount(index: index) != 5 {
                bool = false
                break
            }
        }
        game.giveCard(cardNum: 7)
        for index in 0..<playerCount {
            if game.playerHandCount(index: index) != 7 {
                bool = false
                break
            }
        }
        XCTAssertTrue(bool)
    }
}
