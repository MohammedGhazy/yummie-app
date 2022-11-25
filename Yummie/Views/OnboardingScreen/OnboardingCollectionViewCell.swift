//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideSubTitleLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image    = slide.image
        slideTitleLabel.text    = slide.title
        slideSubTitleLabel.text = slide.subTitle
    }
}
