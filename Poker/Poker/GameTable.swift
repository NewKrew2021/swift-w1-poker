//
//  GameTable.swift
//  Poker
//
//  Created by 지현우 on 2021/01/07.
//

import Foundation

class GameTable{
    enum KindOfGame: Int{
        case fiveCards = 5
        case sevenCard = 7
    }
    //N - 카드 게임 종류
    private var numberOfCard: KindOfGame
    //딜러 1명
    private let dealer: Dealer = Dealer(name: "Dealer")
    //참가자 1~4명
    private var players: [Player] = []
    private var deck: Deck = Deck()
    //남은 카드로 진행이 가능한가? func -> Computed Property
    private var isAvailable: Bool{
        deck.count >= numberOfCard.rawValue ? true : false
    }
    
    init(numberOfCard: KindOfGame) {
        self.numberOfCard = numberOfCard
    }
    
    //새로운 게임 시작
    func startNewGame(){
        if isAvailable{
            distributeCard()
            print("총 \(deck.count)장의 카드가 남아있습니다.")
        }else{
            print("덱에 카드가 존재하지 않습니다. 덱의 카드를 새로 갈아주세요.")
            _ = deck.initCardDeck()
            print("카드 전체를 초기화 했습니다.")
            print("총 \(self.deck.count)장의 카드가 있습니다.")
            
            _ = deck.shuffleDeck()
            print("총 \(self.deck.count)장의 카드를 섞었습니다.")
            
            distributeCard()
        }
    }
    
    //카드 나눠주기 private
    func distributeCard(){
        for _ in 1...numberOfCard.rawValue{
            if let removeCard = deck.removeOne(){
                dealer.getCardForDeck(card: removeCard)
                
                print(removeCard.description)
            }
        }
        
        for player in players{
            for _ in 1...numberOfCard.rawValue{
                if let removeCard = deck.removeOne(){
                    player.getCardForDeck(card: removeCard)
                    
                    print(removeCard.description)
                }
            }
        }
    }
    
    //게임 결과 오픈
    func winnerOfGame() -> String{
        var allOfPairs: [Player] = []
        
        allOfPairs.append(contentsOf: self.players)
        allOfPairs.append(dealer)
        
        allOfPairs.forEach {
            print($0.getCards())
            print($0.getPair())
        }
        
        allOfPairs.sort{
            $0.pair > $1.pair
        }
        
        return allOfPairs[0].name
    }
    
    //새로운 플레이어 진입
    func enterPlayerInGame(_ newPlayer: Player){
        if players.count < 4{
            players.append(newPlayer)
        }
    }
    
    //플레이어 나감
    func leavePlayerInGame(name: String){
        self.players.enumerated().forEach {
            if $0.element.name == name{
                players.remove(at: $0.offset)
            }
        }
    }
    
}
