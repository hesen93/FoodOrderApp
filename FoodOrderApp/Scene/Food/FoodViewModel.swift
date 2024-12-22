//
//  FoodViewModel.swift
//  FoodOrderApp
//
//  Created by ferid on 11.12.24.
//

import Foundation
import UIKit

class FoodViewModel {
    
    var foods:[Food] = []
    let manager = BasketAdapter()
    var basketItems: [Food: Int] = [:]
    
    func addItemToBasket(index: Int) {
        let selectedItem = foods[index]
        
        manager.readData { basketDict in
            self.basketItems = basketDict ?? [:]
            
            if let count = self.basketItems[selectedItem] {
                self.basketItems[selectedItem] = count + 1
            } else {
                self.basketItems[selectedItem] = 1
            }
            self.manager.writeData(item: self.basketItems)
        }
    }
}
