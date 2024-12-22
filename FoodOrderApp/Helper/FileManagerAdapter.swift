//
//  FileManagerAdapter.swift
//  FoodOrderApp
//
//  Created by ferid on 08.12.24.
//

import Foundation

class FileManagerAdapter {
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("User.json")
        print(path)
        return path
    }
    
    func readData(completion: (([User]) ->Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
              let users = try JSONDecoder().decode([User].self, from: data)
                completion(users)
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    func writeData(user:[User]) {
        do {
            let data = try JSONEncoder().encode(user)
            let path = getFilePath()
            try data.write(to: path)
        }catch {
            print(error.localizedDescription)
        }
    }
}
