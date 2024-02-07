//
//  ViewController.swift
//  Car animated
//
//  Created by Игорь Крысин on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenCarConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var purpleCarConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var yellowCarConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startButton(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 5, delay: 0.0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                self.greenCarConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.purpleCarConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.yellowCarConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

