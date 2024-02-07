//
//  ViewController.swift
//  homeWork 18.7 NavController
//
//  Created by Игорь Крысин on 28.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var named: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"
        
        named.placeholder = "Full name"
        age.placeholder = "Age"
        city.placeholder = "City"
        email.placeholder = "E-mail"
        
        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapToScreen)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ProfileViewController" else { return }
        //
        guard let destination = segue.destination as? ProfileViewController else { return }
        
        destination.profileName = named.text ?? ""
        destination.profileAge = age.text ?? ""
        destination.profileCity = city.text ?? ""
        destination.profileEmail = email.text ?? ""
        
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

