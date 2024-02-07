//
//  SmileViewController.swift
//  TemperatureSmileCollectionApp
//
//  Created by Игорь Крысин on 12.01.2024.
//

import UIKit

class SmileViewController: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image = UIImage(named: imageName)
    }
    
    func setImageName(name: String) {
        self.imageName = name
    }
}
