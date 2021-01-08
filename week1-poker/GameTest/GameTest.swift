//
//  GameTest.swift
//  GameTest
//
//  Created by 윤준수 on 2021/01/08.
//

import XCTest

class GameTest: XCTestCase {
    
    var dealer = Dealer()
    var game = Poker(dealer: Dealer())
    var gamers: [Person] = []
    
    override func setUpWithError() throws {
        game = Poker(dealer: dealer)
        gamers = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4), Player(id: 5)]
    }

    func testAddGamer1Success() throws {
        let gamerCnt = 1
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        XCTAssertEqual(game.gamers.count, gamerCnt+1)
    }
    
    func testAddGamer2Success() throws {
        let gamerCnt = 2
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        XCTAssertEqual(game.gamers.count, gamerCnt+1)
    }
    
    func testAddGamer3Success() throws {
        let gamerCnt = 3
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        XCTAssertEqual(game.gamers.count, gamerCnt+1)
    }
    
    func testAddGamer4Success() throws {
        let gamerCnt = 4
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        XCTAssertEqual(game.gamers.count, gamerCnt+1)
    }
    
    func testAddGamer5Fail() throws {
        let gamerCnt = 5
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        XCTAssertNotEqual(game.gamers.count, gamerCnt+1)
    }
    
    func testFiveCardStudSuccess() throws{
        let gamerCnt = 4
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        game.startGame()
        for gamer in game.gamers {
            XCTAssertEqual(5, gamer.hand.count)
        }
    }
    
    func testSevenCardStudSuccess() throws{
        let gamerCnt = 4
        game.gameType = .SevenCardStud
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        game.startGame()
        for gamer in game.gamers {
            XCTAssertEqual(7, gamer.hand.count)
        }
    }
    
    func testStartGameSuccessSevenCardStud() throws{
        let gamerCnt = 4
        game.gameType = .SevenCardStud
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        game.startGame()
        
        let numOfRequiredCards = 7 * (gamerCnt+1)
        XCTAssertTrue((53 - dealer.count) % numOfRequiredCards == 0)
    }

    func testStartGameSuccessFiveCardStud() throws{
        let gamerCnt = 3
        for i in 0..<gamerCnt{
            game.addGamer(gamer: gamers[i])
        }
        game.startGame()
        
        let numOfRequiredCards = 5 * (gamerCnt+1)
        XCTAssertTrue((53 - dealer.count) % numOfRequiredCards == 0)
    }

}
