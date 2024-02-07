//
//  ViewController.swift
//  viewController
//
//  Created by Игорь Крысин on 25.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var myButton: UIButton!
    
//    override func loadView() {
//        print(#function)
//        let view = UIView()
//        self.view = view
//        self.view.backgroundColor = .blue
//    }
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.identifier as? SecondViewController {
            if segue.identifier == "hello" {
                destination.emodji = "🥰"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC", #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC", #function)
    }
    
    override func viewWillLayoutSubviews() {
        print("VC", #function)
        
    }
    
    override func viewDidLayoutSubviews() {
        print("VC", #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC", #function)
    }
    
    
    
    
    @IBAction func myButton(_ sender: Any) {
        print("tapped")
        myLabel.text = "Button was tapped"
        myButton.tintColor = .blue
    }
}

