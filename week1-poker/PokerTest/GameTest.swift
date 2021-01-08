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
    
    func test조커쓸때포카드점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .five)
                    ,Card(shape: .spades, rank: .six),Card(shape: .joker, rank: nil)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 5049)
    }
    
    func test조커안쓸때포카드점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .five)
                    ,Card(shape: .joker, rank: nil),Card(shape: .diamonds, rank: .five)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 5050)
    }
    
    func test조커없을때포카드점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .five)
                    ,Card(shape: .spades, rank: .eight),Card(shape: .diamonds, rank: .five)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 5050)
    }
    
    func test조커쓸때_스트레이트점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .spades, rank: .four),Card(shape: .spades, rank: .three)
                    ,Card(shape: .spades, rank: .six),Card(shape: .joker, rank: nil)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 4069)
    }
    
    func test조커안쓸때_스트레이트점수() throws {
        let hand = [Card(shape: .spades, rank: .eleven),Card(shape: .spades, rank: .ten),Card(shape: .spades, rank: .nine)
                    ,Card(shape: .joker, rank: nil),Card(shape: .spades, rank: .seven), Card(shape: .diamonds, rank: .twelve), Card(shape: .clubs, rank: .thirteen)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 4130)
    }
    
    func test조커없을때_스트레이트점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .six),Card(shape: .hearts, rank: .four)
                    ,Card(shape: .spades, rank: .eight),Card(shape: .diamonds, rank: .seven)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 4080)
    }
    
    func test조커쓸때_트리플점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .three)
                    ,Card(shape: .spades, rank: .one),Card(shape: .joker, rank: nil)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 3049)
    }
    
    
    func test조커없을때_트리플점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .five)
                    ,Card(shape: .spades, rank: .eight),Card(shape: .diamonds, rank: .ten)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 3050)
    }
    
    func test조커없을때_투페어점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .seven)
                    ,Card(shape: .spades, rank: .eight),Card(shape: .diamonds, rank: .seven)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 2070)
    }
    
    func test조커쓸때_원페어점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .two),Card(shape: .hearts, rank: .one)
                    ,Card(shape: .spades, rank: .nine),Card(shape: .joker, rank: nil)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 1089)
    }
    
    func test조커없을때_원페어점수() throws {
        let hand = [Card(shape: .spades, rank: .five),Card(shape: .clubs, rank: .five),Card(shape: .hearts, rank: .three)
                    ,Card(shape: .spades, rank: .two),Card(shape: .diamonds, rank: .nine)]
        
        XCTAssertEqual(PokerScoreMachine.getScore(hand: hand), 1050)
    }
}
