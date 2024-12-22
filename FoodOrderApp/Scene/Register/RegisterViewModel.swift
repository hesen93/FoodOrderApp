//
//  RegisterViewModel.swift
//  FoodOrderApp
//
//  Created by ferid on 22.12.24.
//

import Foundation

class RegisterViewModel {
    
    var fileManagerAdapter = FileManagerAdapter()
    var users = [User]()
    var callback: ((String,String,String,String) -> Void)?
    
}
