//
//  BasketModel.swift
//  FoodOrderApp
//
//  Created by ferid on 10.12.24.
//

import Foundation

class BasketAdapter {
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("Basketin.json")
        print(path)
        return path
    }
    
    func readData(completion: (([Food:Int]?) ->Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let foods = try JSONDecoder().decode([Food:Int].self, from: data)
                completion(foods)
            }catch {
                print(error.localizedDescription)
            }
        }else {
            completion(nil)
        }
    }
    func writeData(item:[Food:Int]) {
        do {
            let data = try JSONEncoder().encode(item)
            let path = getFilePath()
            try data.write(to: path)
        }catch {
            print(error.localizedDescription)
        }
    }
}
