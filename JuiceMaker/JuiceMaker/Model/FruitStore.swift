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
    // TODO: 아규먼트 레이블 호출부에서 사용할때 어색한 부분 없는지 체크
    func updateFruitStock(of fruit: Fruit, for quantity: Int) {
        guard let _ = fruitStock[fruit] else {
            return
        }
        
        guard quantity >= 0 else {
            return
        }
        
        fruitStock[fruit] = quantity
    }
    
    func subtractFruitStock(of fruit: Fruit, quantity: Int) {
        guard let nowStock = fruitStock[fruit], nowStock >= quantity else {
            return
        }
        
        fruitStock[fruit] = nowStock - quantity
    }
}
