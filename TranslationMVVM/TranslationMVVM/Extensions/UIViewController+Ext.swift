//
//  UIViewController+Ext.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 10/01/2023.
//

import UIKit

extension UIViewController {
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
