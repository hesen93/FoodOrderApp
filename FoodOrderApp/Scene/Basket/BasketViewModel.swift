//
//  BasketViewModel.swift
//  FoodOrderApp
//
//  Created by ferid on 22.12.24.
//

import Foundation
class BasketViewModel {
    
    var basketItemsRead = BasketAdapter()
    var basketFoods:[Food:Int] = [:]
    var totalAmountInt:Int = 0
    
    func calculateTotalAmount() -> String {
            var total = 0
            for (food, count) in basketFoods {
                total += (Int(food.foodPrice) ?? 0) * count
            }
            return "Amount Total:\(total)"
        }
    func addFood(food:Food) {
        basketFoods[food] = (self.basketFoods[food] ?? 0) + 1
        basketItemsRead.writeData(item: self.basketFoods)
    }
    func removeFood(food:Food) {
        if self.basketFoods[food] == 1 {
            self.basketFoods.removeValue(forKey: food)
        } else {
            self.basketFoods[food]! -= 1
        }
        self.basketItemsRead.writeData(item: self.basketFoods)
    }
}
