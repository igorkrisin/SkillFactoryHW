//
//  ViewController.swift
//  AnimationConstraint
//
//  Created by Игорь Крысин on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelTopConstraint.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.labelTopConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        })
    }


}

