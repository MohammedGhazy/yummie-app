//
//  OrdersListVC.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit

class OrdersListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var oredersArray: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        tableView.register(UINib(nibName: "DishListCell", bundle: nil), forCellReuseIdentifier: Constants.allDishesReuseIdentefier)
        
        ProgressHUD.show()
        NetworkService.shared.fetchOrders {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self.oredersArray = orders
                self.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}

extension OrdersListVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oredersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.allDishesReuseIdentefier, for: indexPath) as! DishListCell
        cell.setup(order: oredersArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailVC.instantiate()
        controller.dish = oredersArray[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
