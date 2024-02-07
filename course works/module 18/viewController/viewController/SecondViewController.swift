//
//  SecondViewController.swift
//  viewController
//
//  Created by Игорь Крысин on 26.12.2023.
//

import UIKit



class SecondViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    var emodji = "🐼"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = emodji
    }
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


