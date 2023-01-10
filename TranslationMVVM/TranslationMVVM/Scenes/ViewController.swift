//
//  ViewController.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 09/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.makeBorder(color: .lightGray)
        outputLabel.makeCornerRadius()
        
//        let request = DetectRequest(q: "Hello, World!")
//        NetworkManager.shared.postTranslateDetect(request: request) { result in
//            switch result {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
    }


}

