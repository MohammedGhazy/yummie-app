//
//  UIView+Ext.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
