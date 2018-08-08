//
//  UIColor_ext.swift
//  Poddler
//
//  Created by Sven Pohle on 7/11/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import UIKit

struct ColorTheme {
    static let tabBarTintColor = UIColor(r: 20, g: 20, b: 20)
    
    struct searchController {
        static let background = UIColor(r: 240, g: 240, b: 240)
        static let overlayColor = UIColor(r: 40, g: 40, b: 40)
        static let overlayTextColor = UIColor(r: 240, g: 240, b: 240)
    }
}

extension UIColor {
    convenience init(r: Double, g: Double, b: Double) {
        self.init(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(1.0))
    }
}
