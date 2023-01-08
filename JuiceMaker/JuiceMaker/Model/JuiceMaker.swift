//
//  JuiceMaker - JuiceMaker.swift
//  Created by Harry, Sehong.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(by juice: Juice) throws {
        for (fruit, quantity) in juice.recipe {
            guard let fruitStock = fruitStore.fruitStock[fruit], fruitStock >= quantity else {
                throw JuiceMakerError.outOfStock
            }
            
            fruitStore.subtractFruitStock(of: fruit, quantity: quantity)
        }
    }
}
