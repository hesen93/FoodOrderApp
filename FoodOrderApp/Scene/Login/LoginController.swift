//
//  LoginController.swift
//  FoodOrderApp
//
//  Created by ferid on 07.12.24.
//

import UIKit

class LoginController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.fileManagerAdapter.readData { usersData in
            loginViewModel.users = usersData
        }
       
    }

    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = email.text,
           let password = password.text {
            if loginViewModel.users.contains(where: {$0.email == email && $0.password == password}) {
                let controller = storyboard?.instantiateViewController(withIdentifier: "HomeController") as! HomeController
                navigationController?.show(controller, sender: nil)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Incorrect info", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(action)
                present(alertController,animated: true)
            }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        navigationController?.show(controller, sender: nil)
        controller.registerViewModel.callback = {fullnameR,emailR,phoneNumberR,passwordR in
            self.email.text = emailR
            self.password.text = passwordR
        }
    }
}
