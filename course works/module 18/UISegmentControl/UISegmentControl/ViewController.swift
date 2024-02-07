//
//  ViewController.swift
//  UISegmentControl
//
//  Created by Игорь Крысин on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var image = UIImageView()
    var menuArray = ["one", "two", "three"]

    let imageArray = [UIImage(named: "roja.jpg"),
                      UIImage(named: "roza.avif"),
                      UIImage(named: "roza1.jpg")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.image.center = self.view.center
        self.image.image = self.imageArray[0]
        self.view.addSubview(self.image)
        
        //create segme
        self.segmentControl = UISegmentedControl(items: self.menuArray)
        self.segmentControl.frame = CGRect(x: 100, y: 500, width: 200, height: 30)
        self.view.addSubview(self.segmentControl)
        
        
        self.segmentControl.addTarget(self, action: #selector(selectedValue(target:)), for: .valueChanged)
        
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            self.image.image = self.imageArray[segmentIndex]
        }
    }
    
    @IBAction func showNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
        self.present(vc, animated: true, completion: nil)
    }

}

