//
//  Player.swift
//  PokerApp
//
//  Created by 윤준수 on 2021/01/07.
//

import Foundation
class Player: Person {
    private let _id: Int
    public var id: Int {
        get {
            return _id
        }
    }
    
    init(id: Int) {
        _id = id
    }
}
