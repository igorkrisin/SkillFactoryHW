//
//  SecondViewController.swift
//  emodji
//
//  Created by Игорь Крысин on 26.12.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var emodjiLabel: UILabel!
    
    var emodji = "🥹"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emodjiLabel.text = emodji
    }
    

}
