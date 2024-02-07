//
//  ViewController.swift
//  MyNavigationView
//
//  Created by Игорь Крысин on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        self.title = "First NVC"
        
        self.displaySecondButton = UIButton(type: .system)
        self.displaySecondButton.setTitle("SecondVC", for: .normal)
        self.displaySecondButton.sizeToFit()
        self.displaySecondButton.center = self.view.center
        self.displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC(parametrSender:)), for: .touchUpInside)
        self.view.addSubview(self.displaySecondButton)
        
    }
    
    @objc func performDisplaySecondVC(parametrSender: Any) {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

