//
//  main.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/06.
//

import Foundation

var deck = Deck()
print("> 카드 초기화")
print("카드 전체를 초기화했습니다.")
print("총 \(deck.count())장의 카드가 있습니다.")
print()

print("> 카드 섞기")
deck.shuffle()
print("전체 \(deck.count())장의 카드를 섞었습니다.")
print()

for _ in 0...2 {
    print("> 카드 하나 뽑기")
    print(deck.removeOne() ?? "카드가 없습니다")
    print("총 \(deck.count())장의 카드가 남아있습니다.")
    print()
}
