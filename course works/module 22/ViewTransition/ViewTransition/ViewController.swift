//
//  ViewController.swift
//  ViewTransition
//
//  Created by Игорь Крысин on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var isFlipped: Bool = false
    var predictions = ["все круто", "все еще круче", "все мега-круто"]
    
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var secondViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
    }

    @IBAction func transitionButton(_ sender: Any) {
        isFlipped.toggle()
        let firsrCard = isFlipped ? firstView : secondView
        let secondCard = isFlipped ? secondView : firstView
        
        UIView.transition(from: firsrCard!, to: secondCard!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews]) { _ in
            let  randomInt = Int.random(in: 0..<self.predictions.count)
            self.secondViewLabel.text = self.predictions[randomInt]
        }
        
    }
    
}

