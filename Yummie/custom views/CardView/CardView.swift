//
//  CardView.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import UIKit
class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = .zero
        layer.cornerRadius  = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius  = 10
        cornerRadius        = 10
    }
}
