//
//  OnboardingVC.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    var slidesArray: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slidesArray.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate   = self
        collectionView.dataSource = self
        slidesArray = [
            OnboardingSlide(title: "Delicious Dishes", subTitle: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", subTitle: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", subTitle: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        pageControl.numberOfPages = slidesArray.count
    }
    
    @IBAction func nextButtonPress(_ sender: UIButton) {
        if currentPage == slidesArray.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: Constants.HomeStoryboardID) as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle   = .flipHorizontal
            present(controller, animated: true,completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
}


extension OnboardingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidesArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.onboardingReuseIdentifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slidesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
