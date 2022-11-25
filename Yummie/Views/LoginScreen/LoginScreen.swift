//
//  LoginScreen.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 23/11/2022.
//

import UIKit

class LoginScreen: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToSignup(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: Constants.SignupStoryboardID) as! RegisterScreen
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle   = .partialCurl
//        present(controller, animated: true,completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
}
