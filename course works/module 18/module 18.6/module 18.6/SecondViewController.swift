//
//  SecondViewController.swift
//  module 18.6
//
//  Created by Игорь Крысин on 28.12.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 100))
        view.addSubview(button)
        button.setTitle("Hello", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.center = view.center
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))
        //target - цель
    }
    
    @objc func edit() {
        print("edit is done")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
