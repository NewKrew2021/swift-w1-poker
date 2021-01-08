//
//  CardNum.swift
//  Poker
//
//  Created by 지현우 on 2021/01/08.
//

import Foundation

enum CardNum: Int, CaseIterable{
    case joker = 0
    case one, two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    case none
}


extension CardNum{
    func convertFromNumToString() -> String{
        if self.rawValue == 0 {
            return "Joker"
        } else if self.rawValue == 1{
            return "A"
        } else if self.rawValue == 11{
            return "J"
        } else if self.rawValue == 12{
            return "Q"
        } else if self.rawValue == 13{
            return "K"
        } else{
            return String(self.rawValue)
        }
    }
}
