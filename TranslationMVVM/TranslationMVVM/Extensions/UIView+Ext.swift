//
//  UIView+Ext.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 10/01/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func makeBorder(color:UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 0.2
    }
    
    func makeCornerRadius(radius: CGFloat = 4) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
}
