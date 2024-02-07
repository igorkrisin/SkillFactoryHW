//
//  ViewController.swift
//  fakeMessenger
//
//  Created by Игорь Крысин on 29.01.2024.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var buttonWithImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tappedUrlButton(_ sender: Any) {
        guard let showVC = storyboard?.instantiateViewController(withIdentifier: "ShowWebView") else { return }
        
        present(showVC, animated: true, completion: nil)
    }
    

    @IBAction func urlSafariTapped(_ sender: Any) {
        let urlString = "https://alise-flowers.ru/bukety"
        guard let url = URL(string: urlString) else { return }
        let safaryVC: SFSafariViewController = SFSafariViewController(url: url)
        
        safaryVC.preferredBarTintColor = .gray
        present(safaryVC, animated: true)
        
    }
    
    
    @IBAction func micButton(_ sender: Any) {
        print("mic")
    }
    
}

