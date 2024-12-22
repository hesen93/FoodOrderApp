//
//  RegisterController.swift
//  FoodOrderApp
//
//  Created by ferid on 07.12.24.
//

import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var fullnameR: UITextField!
    
    @IBOutlet weak var emailR: UITextField!
    
    @IBOutlet weak var phoneNumberR: UITextField!
    
    @IBOutlet weak var passwordR: UITextField!
    
    var registerViewModel = RegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerViewModel.fileManagerAdapter.readData { usersData in
            registerViewModel.users = usersData
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let fullnameR = fullnameR.text, !fullnameR.isEmpty,
           let emailR = emailR.text, !emailR.isEmpty ,
           let phoneNumberR = phoneNumberR.text, !phoneNumberR.isEmpty,
           let passwordR = passwordR.text, !passwordR.isEmpty {
            let newUser = User(fullname: fullnameR, email: emailR, phoneNumber: phoneNumberR, password: passwordR)
            registerViewModel.users.append(newUser)
            registerViewModel.callback?(fullnameR,emailR,phoneNumberR,passwordR)
            registerViewModel.fileManagerAdapter.writeData(user:registerViewModel.users)
            navigationController?.popViewController(animated: true)
        }
    }
}
