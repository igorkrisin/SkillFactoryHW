//
//  ViewController.swift
//  setStateViewToSwitch
//
//  Created by Игорь Крысин on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let switchKey = "SwitchState"
    let imageKey = "ImageName"
    
    
    var mySwitch: UISwitch = UISwitch()
    
    var imageView = UIImageView()
        
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = createUIIMage(name: "light", x: Int(view.center.x/2), y: Int(view.center.y/2), width: 200, height: 200)
        mySwitch = createSwitch(x: Int(UIScreen.main.bounds.size.width/2 - 30), y: Int(view.bounds.height - 200), width: 100, height: 150)
        mySwitch.isOn = UserDefaults.standard.bool(forKey: switchKey)
        setStateView(mySwitch)
        view.addSubview(imageView)
        view.addSubview(mySwitch)
        
    }
    
    func createUIIMage(name: String, x: Int, y: Int, width: Int,  height: Int) -> UIImageView {
        let imageView = UIImageView()
        guard let image: UIImage = UIImage(named: name) else { return  UIImageView()}
        imageView.image = image
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        
        return imageView
    }
    
    func createSwitch( x: Int, y: Int, width: Int,  height: Int) -> UISwitch {
        let mySwitch: UISwitch = UISwitch()
        mySwitch.frame = CGRect(x: x, y: y, width: width, height: height)
        mySwitch.addTarget(self, action: #selector(setStateView), for: .valueChanged)
        return mySwitch
    }
    
    @objc func setStateView(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: switchKey)
        if sender.isOn {
            setTheme(namedImage: "dark", color: .black)
         } else  {
             setTheme(namedImage: "light", color: .white)
         }
        print(sender.isOn)
        
    }
    
    func setTheme(namedImage: String, color: UIColor) {
        view.backgroundColor = color
        imageView.image = UIImage(named: namedImage)
        UserDefaults.standard.set(namedImage, forKey: imageKey)
        
    }
 
}

