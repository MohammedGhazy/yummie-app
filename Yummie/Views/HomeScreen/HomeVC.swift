//
//  HomeVC.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    var categoriesArray: [DishCategory] = []
    var popularsArray: [Dish] = []
    var specialsArray: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categoriesArray = allDishes.categories ?? []
                self?.popularsArray   = allDishes.populars ?? []
                self?.specialsArray   = allDishes.specials ?? []
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.categoryReuseIdentifier)
        popularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.popularReuseIdentifier)
        specialCollectionView.register(UINib(nibName: "SpecialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.specialReuseIdentifier)
    }
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categoriesArray.count
        case popularCollectionView:
            return popularsArray.count
        case specialCollectionView:
            return specialsArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.categoryReuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categoriesArray[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.popularReuseIdentifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(popular: popularsArray[indexPath.row])
            return cell
        case specialCollectionView:
            let cell = specialCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.specialReuseIdentifier, for: indexPath) as! SpecialCollectionViewCell
            cell.setup(special: specialsArray[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = DishesListVC.instantiate()
            controller.category = categoriesArray[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DetailVC.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularsArray[indexPath.row] : specialsArray[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
