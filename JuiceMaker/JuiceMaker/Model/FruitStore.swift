//
//  JuiceMaker - FruitStore.swift
//  Created by Harry, Sehong. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    // 싱글톤 왜쓰는지? -> 하나다? 뭐가하난데? 인스턴스가하나야. 그리고 이거는 모든곳에서 공유가능해. 이 인스턴스 하나만..
    static let shared = FruitStore()
    
    var fruitStock: [Fruit: Int] = [:]
    
    // TODO: self 쓸지 고민해보기 -> 해결
    private init() {
        fruitStock = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
        
        print(fruitStock)
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
