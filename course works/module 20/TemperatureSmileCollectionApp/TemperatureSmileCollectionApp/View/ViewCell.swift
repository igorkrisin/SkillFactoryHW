//
//  ViewCell.swift
//  TemperatureSmileCollectionApp
//
//  Created by Игорь Крысин on 12.01.2024.
//

import UIKit

class ViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var temperatureImage: UIImageView!
    
    @IBOutlet weak var smileImage: UIImageView!
    
    
    func setTemperatureImage(name: String) {
        self.temperatureImage.image = UIImage(named: name)
    }
    
    func setSmileImage(name:String) {
        self.smileImage.image = UIImage(named: name)
    }
    
    
    
    
    
    
    
    
    
}
