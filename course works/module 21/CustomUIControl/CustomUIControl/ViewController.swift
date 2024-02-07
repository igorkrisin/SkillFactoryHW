//
//  ViewController.swift
//  CustomUIControl
//
//  Created by Игорь Крысин on 17.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customSegment: CustomSegment!
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSegment.items = ["DAILY", "WEEKLY", "MONTHLY"]
        customSegment.font = UIFont(name: "Avenir-Black", size: 12)
        customSegment.selectIndex = 1
        customSegment.padding = 4
        customSegment.addTarget(self, action: #selector(ViewController.segmentValueChanged(_:)), for: .valueChanged)
        
        statusLabel.font = UIFont(name: "Avenir-Black", size: 12)
        statusLabel.textColor = UIColor(white: 1.0, alpha: 1.0)
        statusLabel.text = "PROFIT"
        
        amountLabel.font = UIFont(name: "Avenir-Black", size: 12)
        amountLabel.textColor = UIColor(white: 1.0, alpha: 1.0)
        amountLabel.text = "$56 789"
        
        pictureView.image = UIImage(named: "el-capitan")
        pictureView.clipsToBounds = true
        pictureView.contentMode = .scaleAspectFill
    }
    
    @objc func segmentValueChanged(_ sender: AnyObject?) {
        if customSegment.selectIndex == 0 {
            amountLabel.text = "$1,330"
        } else if customSegment.selectIndex == 1 {
            amountLabel.text = "$56 789"
        } else {
            amountLabel.text = "$103 444"
        }
    }

}

