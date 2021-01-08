//
//  Player.swift
//  Poker
//
//  Created by 지현우 on 2021/01/07.
//

import Foundation

class Player{
    struct Pair{
        var num: CardNum
        var duplicate: Int
    }
    
    let name: String
    private var cards: [Card] = []
    private var money: Int?
    var pair: Pair = Pair(num: .none, duplicate: 0)
    
    init(name: String) {
        self.name = name
    }
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func getCardForDeck(card: Card){
        self.cards.append(card)
    }
    
    //정렬된 카드 출력
    func getCards() -> String{
        self.cards.sort {
            $0 < $1
        }
        
        return self.cards.reduce("Cards: "){ "\($0.description), \($1.description)" }
    }
    
    //가장 높은 족보 출력
    func getPair() -> String{
        var pairs = numberOfPairs()
        pairs.sort{
            $0 > $1
        }
        self.pair = pairs.first ?? Pair(num: .none, duplicate: 0)
        
        return self.pair.description
    }
    
    //Player의 갖고 있는 페어 확인
    private func numberOfPairs() -> [Pair]{
        var pairs : [Pair] = []
        var countOfDuplicate = 0 // 중복횟수
        
        for index in 0 ..< self.cards.count - 1{
            let number = self.cards[index].num
            let next = self.cards[index + 1].num
            
            if number.rawValue == next.rawValue{
                //중복 횟수 ++
                countOfDuplicate += 1
                if index == self.cards.count - 2{
                    pairs.append(Pair(num: number, duplicate: countOfDuplicate))
                }
            }else{
                if countOfDuplicate >= 1{
                    pairs.append(Pair(num: number, duplicate: countOfDuplicate))
                    countOfDuplicate = 0
                }
            }
        }
        
        return pairs
    }
    
}

extension Player.Pair: Comparable{
    static func <(lhs: Player.Pair, rhs: Player.Pair) -> Bool{
        if lhs.duplicate != rhs.duplicate{
            return lhs.duplicate < rhs.duplicate
        }else{
            return lhs.num.rawValue < rhs.num.rawValue
        }
    }
    
    var description: String{
        if self.duplicate == 0{
            return "페어가 없습니다."
        }
        else if self.duplicate == 1{
            return "원페어 - \(self.num.convertFromNumToString())"
        } else if self.duplicate == 2{
            return "트리플 - \(self.num.convertFromNumToString())"
        } else{
            return "포카드 - \(self.num.convertFromNumToString())"
        }
    }
}
