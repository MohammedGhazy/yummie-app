//
//  DetailVC.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
    }
    private func populateView() {
        detailImageView.kf.setImage(with: dish.image?.asURL)
        dishNameLabel.text = dish.name
        caloriesLabel.text = String(describing: "\(dish.calories!) calories")
        descriptionLabel.text = dish.description
    }
    
    @IBAction func placeOrderBtnPress(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) , !name.isEmpty else {
            ProgressHUD.showError("Please Enter Your Name")
            return
        }
        ProgressHUD.show("Your Order In Progress")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) {[weak self] result in
            guard let _ = self else { return }
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("your Order Recieved")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
