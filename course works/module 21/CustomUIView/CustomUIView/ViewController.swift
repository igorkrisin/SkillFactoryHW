//
//  ViewController.swift
//  CustomUIView
//
//  Created by Игорь Крысин on 16.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var myCustomView: MyCustomView = MyCustomView(frame: CGRect(x: 87, y: 200, width: 240, height: 240))

    override func viewDidLoad() {
        super.viewDidLoad()
        myCustomView.labelText = "CUSTOM"
        myCustomView.workingView.backgroundColor = .systemPink
        view.addSubview(myCustomView)
        
        // Do any additional setup after loading the view.
    }


}

