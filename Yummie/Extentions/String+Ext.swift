//
//  String+Ext.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
