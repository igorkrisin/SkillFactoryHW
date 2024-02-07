//
//  SecondViewController.swift
//  UINavigationController
//
//  Created by Игорь Крысин on 27.12.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))
        // Do any additional setup after loading the view.
    }
    
    @objc func edit() {
        print("Edit is done")
    }

}
