//
//  Deck.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/06.
//

import Foundation

struct Deck {
    
    // 클래스 메모리 관리 방식에 대해 학습한다. reset() 할때 이전에 만든 카드 객체는 어떻게 되는지 확인한다.
    // --> ARC로 인해 메모리가 자동적으로 해제된다.
    
    var cards : [Card] = [Card]()
    
    init() {
        reset()
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    // Fisher-Yates shuffle 알고리즘
    mutating func shuffle() {
        print("> 카드 섞기")
        for i in 0..<self.cards.count - 1 { // 0 ~ n-2
            let randomIndex = Int.random(in: i..<self.cards.count)
            
            let temp = self.cards[i]
            self.cards[i] = self.cards[randomIndex]
            self.cards[randomIndex] = temp
        }
        print("전체 \(self.count())장의 카드를 섞었습니다.")
    }
    
    mutating func removeOne() -> Card? {
        print("> 카드 하나 뽑기")
        if self.count() == 0 {
            print("현재 카드가 없습니다.")
            return nil
        } else {
            self.cards.last?.printCard()
            print("총 \(self.count() - 1)장의 카드가 남아있습니다.")
            return self.cards.removeLast()
        }
    }
    
    mutating func reset() {
        self.cards.removeAll()
        self.cards.append(Card(shape: .joker, number: .joker))
        for shape in Card.Shape.allCases {
            if shape == .joker {
                continue
            }
            for number in Card.Number.allCases {
                if number == .joker {
                    continue
                }
                self.cards.append(Card(shape: shape, number: number))
            }
        }
        print("> 카드 초기화")
        print("카드 전체를 초기화했습니다.")
        print("총 \(self.count())장의 카드가 있습니다.")
    }
}
