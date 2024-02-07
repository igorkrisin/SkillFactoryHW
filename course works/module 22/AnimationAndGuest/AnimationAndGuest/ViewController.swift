//
//  ViewController.swift
//  AnimationAndGuest
//
//  Created by Игорь Крысин on 27.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(dragView))
        someView.addGestureRecognizer(recognizer)
    }
    
    @objc func dragView(recognizer: UIPanGestureRecognizer) {
        
        let state = recognizer.state
        
        if state == .changed {
            let translation = recognizer.translation(in: self.view)
            
            let newX = someView.center.x + translation.x
            let newY = someView.center.y + translation.y
            
            someView.center = CGPoint(x: newX, y: newY)
            
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
        }
        
        if state == .ended {
            UIView.animate(withDuration: 0.25) {
                self.someView.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
            }
            
        }
    }

}

