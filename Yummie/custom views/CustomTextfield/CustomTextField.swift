//
//  CustomTextField.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 23/11/2022.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate{

    let border = CALayer()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        createBorder()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        createBorder()
    }

    func createBorder(){
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        clearButtonMode = .whileEditing
        movePlaceholderUp()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        movePlaceholderDown()
    }

    func movePlaceholderUp(){
        border.borderColor = UIColor(red:0.87, green:0.30, blue:0.32, alpha:1.0).cgColor
    }
    func movePlaceholderDown(){
        border.borderColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0).cgColor
    }
}
