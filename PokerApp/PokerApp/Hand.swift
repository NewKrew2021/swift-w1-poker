//
//  Hand.swift
//  PokerApp
//
//  Created by 이청원 on 2021/01/08.
//

import Foundation

struct Hand : CustomStringConvertible {
    private var cards = [Card]()
    
    mutating func removeAll() {
        cards.removeAll()
    }
    
    mutating func plusCard(card: Card) {
        cards.append(card)
    }
    
    var description: String {
        var str = "["
        for i in 0..<cards.count {
            if i == cards.count - 1 {
                str += "\(cards[i])]"
            } else {
                str += "\(cards[i]), "
            }
        }
        return str
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func sortHand() -> [Card] {
        let sortedHand = self.cards.sorted()
        return sortedHand
    }
    
    func checkJoker() -> Bool {
        for card in cards {
            if card.shape == .joker {
                return true
            }
        }
        return false
    }
    
    
    func calculateScore() -> Float {
        let joker = checkJoker()
        var sortedHand = self.sortHand()
        var result : Float = 0
        if joker {
            for shape in Card.Shape.allCases {
                if shape == .joker {
                    continue
                }
                for number in Card.Number.allCases {
                    if number == .ace || number == .jack || number == .queen || number == .king {
                        sortedHand.removeLast()
                        sortedHand.append(Card(shape: shape, number: number))
                        let reSortedHand = sortedHand.sorted()
                        
                        
                        var temp : Float = 0
                        temp += fourCard(sortedCards: reSortedHand)
                        if temp >= 500 {
                            result = max(result, temp) - 0.01
                            continue
                        }
                        temp += straight(sortedCards: reSortedHand)
                        if temp >= 400 {
                            result = max(result, temp) - 0.01
                            continue
                        }
                        temp += tripple(sortedCards: reSortedHand)
                        if temp >= 300 {
                            result = max(result, temp) - 0.01
                            continue
                        }
                        temp += twoPair(sortedCards: reSortedHand)
                        if temp >= 200 {
                            result = max(result, temp) - 0.01
                            continue
                        }
                        temp += pair(sortedCards: reSortedHand)
                        if temp >= 100 {
                            result = max(result, temp) - 0.01
                            continue
                        }
                        temp += reSortedHand[reSortedHand.count - 1].shape.rawValue + reSortedHand[reSortedHand.count - 1].number.rawValue - 0.01
                        result = max(result, temp)
                    }
                }
            }
        }
        else {
            result += fourCard(sortedCards: sortHand())
            if result >= 500 {
                return result
            }
            result += straight(sortedCards: sortHand())
            if result >= 400 {
                return result
            }
            result += tripple(sortedCards: sortHand())
            if result >= 300 {
                return result
            }
            result += twoPair(sortedCards: sortHand())
            if result >= 200 {
                return result
            }
            result += pair(sortedCards: sortHand())
            if result >= 100 {
                return result
            }
            result += sortedHand[sortedHand.count - 1].shape.rawValue + sortedHand[sortedHand.count - 1].number.rawValue
        }
        
        return result
    }
    
    func fourCard(sortedCards:[Card]) -> Float {
        var result : Float = 0
        for i in 0..<sortedCards.count {
            var temp : Float = 500
            var bool = true
            if i+3==sortedCards.count {
                break
            }
            for j in 0...2 {
                if sortedCards[i+j].number.rawValue != sortedCards[i+j+1].number.rawValue {
                    bool = false
                    break
                }
            }
            if bool {
                temp += sortedCards[i+3].shape.rawValue + Float(sortedCards[i+3].number.rawValue)
                result = max(result, temp)
                print("\(sortedCards) \(temp)")
            }
        }
        return result
    }
    
    func straight(sortedCards:[Card]) -> Float {
        var result : Float = 0
        for i in 0..<sortedCards.count {
            var temp : Float = 400
            var bool = true
            if i+4==sortedCards.count {
                break
            }
            for j in 0...3 {
                if sortedCards[i+j].number.rawValue+1 != sortedCards[i+j+1].number.rawValue {
                    bool = false
                    break
                }
            }
            if bool {
                temp += sortedCards[i+4].shape.rawValue + Float(sortedCards[i+4].number.rawValue)
                result = max(result, temp)
            }
        }
        return result
    }
    
    func tripple(sortedCards:[Card]) -> Float {
        var result : Float = 0
        for i in 0..<sortedCards.count {
            var temp : Float = 300
            var bool = true
            if i+2==sortedCards.count {
                break
            }
            for j in 0...1 {
                if sortedCards[i+j].number.rawValue != sortedCards[i+j+1].number.rawValue {
                    bool = false
                    break
                }
            }
            if bool {
                temp += sortedCards[i+2].shape.rawValue + Float(sortedCards[i+2].number.rawValue)
                result = max(result, temp)
            }
        }
        return result
    }
    
    func twoPair(sortedCards:[Card]) -> Float {
        var result : Float = 0
        var pairCnt = 0
        for i in 0..<sortedCards.count-1 {
            var temp : Float = 200
            if sortedCards[i].number.rawValue == sortedCards[i + 1].number.rawValue {
                if pairCnt == 0 {
                    pairCnt += 1
                } else {
                    temp += sortedCards[i+1].shape.rawValue + Float(sortedCards[i+1].number.rawValue)
                    result = max(result, temp)
                }
            }
        }
        return result
    }
    
    func pair(sortedCards:[Card]) -> Float {
        var result : Float = 0
        for i in 0..<sortedCards.count-1 {
            var temp : Float = 100
            if sortedCards[i].number.rawValue == sortedCards[i + 1].number.rawValue {
                temp += sortedCards[i+1].shape.rawValue + Float(sortedCards[i+1].number.rawValue)
                result = max(result, temp)
            }
        }
        return result
    }
}
