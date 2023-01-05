//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitStock: [Fruit: Int]
    // TODO: self 쓸지 고민해보기
    init() {
        fruitStock = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
    }
    
    func updateFruitStock(of fruit: Fruit, quantity: Int) {
        guard let _ = fruitStock[fruit] else {
            return
        }
        
        guard quantity >= 0 else {
            return
        }
        
        fruitStock[fruit] = quantity
    }
}
