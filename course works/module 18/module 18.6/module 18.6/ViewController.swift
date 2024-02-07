//
//  ViewController.swift
//  module 18.6
//
//  Created by Игорь Крысин on 28.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openSVC(_ sender: Any) {
        //через StoryBoard инициируем SecondVC
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        guard let navigatorVC = navigationController else { return }
        navigatorVC.pushViewController(viewController, animated: true)
    }
    
}

