//
//  ViewController.swift
//  animationStart
//
//  Created by Игорь Крысин on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func animationView(_ sender: Any) {
        
        let start = self.someView.center
        
        UIView.animateKeyframes(withDuration: 5,
                                delay: 0,
                                options: .calculationModeCubic) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.25) {
                self.someView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.minY)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.someView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.someView.center = start
            }
        }
    }
    
}

