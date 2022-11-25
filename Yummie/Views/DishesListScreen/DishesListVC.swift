//
//  DishesListVC.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit

class DishesListVC: UIViewController {
    
    @IBOutlet weak var dishesTableView: UITableView!
    var category: DishCategory!
    var allDishesArray: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        dishesTableView.register(UINib(nibName: "DishListCell", bundle: nil), forCellReuseIdentifier: Constants.allDishesReuseIdentefier)
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self.allDishesArray =  dishes ?? []
                self.dishesTableView.reloadData()
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}

extension DishesListVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDishesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dishesTableView.dequeueReusableCell(withIdentifier: Constants.allDishesReuseIdentefier, for: indexPath) as! DishListCell
        cell.setup(dish: allDishesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailVC.instantiate()
        controller.dish = allDishesArray[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
