//
//  HomeViewModel.swift
//  FoodOrderApp
//
//  Created by ferid on 11.12.24.
//

import Foundation

class HomeViewModel {
    var menu: [Category] = []
    
    func getMenu(completion: (() -> Void)) {
        if let fileUrl = Bundle.main.url(forResource: "Menu", withExtension: "json") {
            print(fileUrl)
            do {
                let data = try Data(contentsOf: fileUrl)
                menu = try JSONDecoder().decode([Category].self, from: data)
                print(menu)
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func changedMenu() -> [Category] {
        return menu
    }
}
