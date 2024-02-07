//
//  ViewController.swift
//  SkilFactoryFirstProject
//
//  Created by Игорь Крысин on 18.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myStack: UIStackView!
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var myLable: UILabel!
    
   
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func changeNameLAbel(_ sender: Any) {
        self.myLable.text = "Hello pople"
        self.myLable.font = UIFont(name: "Times new roman", size: 25)
        self.myLable.numberOfLines = 2
        self.myLable.backgroundColor = .blue
        self.blueButton.backgroundColor = .green
        self.blueButton.tintColor = .red
        self.blueButton.setTitle("hello", for: .normal)
        self.blueButton.sizeToFit()
        topConstraint.constant = 20
    }
}

