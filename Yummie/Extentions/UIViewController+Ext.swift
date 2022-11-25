//
//  UIViewController+Ext.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit

extension UIViewController {
    
    //to return name of view controller
    static var identefier: String {
        return String(describing: self)
    }
    
    static func instantiate()-> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identefier) as! Self 
    }
}
