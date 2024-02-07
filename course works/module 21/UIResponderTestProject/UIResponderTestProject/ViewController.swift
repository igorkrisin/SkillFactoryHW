//
//  ViewController.swift
//  UIResponderTestProject
//
//  Created by Игорь Крысин on 19.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let responderLabel = ResponderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        responderLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        responderLabel.center = self.view.center
        
        responderLabel.backgroundColor = UIColor(red: 20.0/255.0, green: 135.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        responderLabel.text = "Hello it's me"
        responderLabel.layer.cornerRadius = 4
        responderLabel.layer.masksToBounds = true
        
        //добавляем на главный view
        self.view.addSubview(responderLabel)
        
        //разрешим пользовательское взаимодействие и создадим распознователь жестов
        
        responderLabel.isUserInteractionEnabled = true
        let longPresRegognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        longPresRegognizer.minimumPressDuration = 0.2
        responderLabel.addGestureRecognizer(longPresRegognizer)
    }
   
    @objc func longPressHandler() {
        //попросим  UIKit сделать наш лейбл первым респондером
        responderLabel.becomeFirstResponder()
        
        let menu = UIMenuController.shared
        menu.arrowDirection = .default
        menu.setTargetRect(responderLabel.frame, in: self.view)
        menu.setMenuVisible(true, animated: true)
        let saveMenuItem = UIMenuItem(title: "save", action: #selector(saveClicked))
        menu.menuItems = [saveMenuItem]
    }
    
    @objc func saveClicked() {
        responderLabel.resignFirstResponder()
        print("saved")
    }

}

