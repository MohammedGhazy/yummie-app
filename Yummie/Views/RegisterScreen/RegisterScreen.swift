//
//  RegisterScreen.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 22/11/2022.
//

import UIKit

class RegisterScreen: UIViewController {
    
    @IBOutlet weak var usernameField: CustomTextField!
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.text = "hamakiiii"
        emailField.text    = "h@iiii.com"
        passwordField.text = "123456789"
    }
    
    @IBAction func goToLoginTapped(_ sender: UIButton) {
        let controller = LoginScreen.instantiate()
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle   = .crossDissolve
        present(controller, animated: true,completion: nil)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
//        ProgressHUD.show()
//        NetworkService.shared.register(username: usernameField.text ?? "", email: emailField.text ?? "", password: passwordField.text ?? "" , q: 1 , a: "answer" , active: 1) {[weak self] result in
//            guard let _ = self else { return }
//            switch result {
//            case .success(let model):
//                let encoder = JSONEncoder()
//                let data = try? encoder.encode(model)
//                UserDefaults.standard.set(data, forKey: "userModel")
//                ProgressHUD.show("congratulation you registered make login please")
//            case .failure(let error):
//                ProgressHUD.showError(error.localizedDescription)
//            }
//        }
    }
    
}
