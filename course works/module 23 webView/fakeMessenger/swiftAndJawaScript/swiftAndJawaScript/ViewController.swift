//
//  ViewController.swift
//  swiftAndJawaScript
//
//  Created by Игорь Крысин on 30.01.2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringUrl = "https://gmail.com"
        
        let url = URL(string: stringUrl)!
        let request = URLRequest(url: url)
        webView.load(request)
    }

    
    @IBAction func javaScriptIntersectionBtnPressed(_ sender: Any) {
        webView.evaluateJavaScript("document.getElementByID('Email').value='Hello World'") { value, error in
            print("VALUE: \(value)")
            print("ERROR: \(error)")
        }
        
    }
}



//работающий код над полем ввода

//var elements = document.getElementsByClassName('\("AxOyFc snByac")');
//if (elements.length > 0) {
//     var element = elements[0]; // Вы можете изменить индекс, если необходимо выбрать другой элемент
//     element.style.backgroundColor = 'red'; // Или другие действия с элементом
//     element.innerHTML = 'My phone'
//}

//работаюший код для надписи под textField
//var elements = document.getElementsByClassName('\("PrDSKc")');
//if (elements.length > 0) {
//     var element = elements[0]; // Вы можете изменить индекс, если необходимо выбрать другой элемент
//     element.style.backgroundColor = 'red'; // Или другие действия с элементом
//     element.innerHTML = 'My phone'
//}


//работающий код под надписью SingIn
//var elements2 = document.getElementsByClassName('\("tosRNd")');
//if (elements2.length > 0) {
//     var element2 = elements2[0]; // Вы можете изменить индекс, если необходимо выбрать другой элемент
//     element2.style.backgroundColor = 'red'; // Или другие действия с элементом
//     element2.innerHTML = 'My phone'
//}
