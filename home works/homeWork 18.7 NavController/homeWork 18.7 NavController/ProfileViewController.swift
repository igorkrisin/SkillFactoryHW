//
//  ProfileViewController.swift
//  homeWork 18.7 NavController
//
//  Created by Игорь Крысин on 28.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var named: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    var profileName = ""
    var profileAge = ""
    var profileCity = ""
    var profileEmail = ""
    
    
    var informationField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Профиль"
        
        named.text = profileName
        age.text = profileAge
        city.text = profileCity
        email.text = profileEmail
        
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
