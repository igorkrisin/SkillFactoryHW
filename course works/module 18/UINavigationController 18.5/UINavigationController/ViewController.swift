//
//  ViewController.swift
//  UINavigationController
//
//  Created by Игорь Крысин on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func OpenSecondVC(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        guard let navigator = navigationController else { return }
        navigator.pushViewController(viewController, animated: true)
    }
   
}

