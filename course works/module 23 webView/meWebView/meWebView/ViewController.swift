//
//  ViewController.swift
//  meWebView
//
//  Created by Игорь Крысин on 29.01.2024.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    @IBOutlet weak var webKitView: WKWebView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let strnigUrl = "https://www.apple.com"
        let url = URL(string: strnigUrl)!
        let request = URLRequest(url: url)
        webKitView.load(request)
       
    }


}

