//
//  ShowWebView.swift
//  fakeMessenger
//
//  Created by Игорь Крысин on 29.01.2024.
//

import UIKit
import WebKit

class ShowWebView: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var labelTop: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var indicatorLoad: UIActivityIndicatorView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorLoad.isHidden = true
        webView.navigationDelegate = self
        
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        
        
        let urlString = "https://alise-flowers.ru/bukety"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func backButtonTapped(_ sender: Any) {
        print("backButtonTapped")
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        print("forwardButtonTapped")
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        print("refresh")
        webView.reload()
    }
    
    private func enableBtnCanGoBack(){
        print("canGoBack")
        if webView.canGoBack {
            backButton.isEnabled = true
        } else {
            backButton.isEnabled = false
        }
    }
    
    private func enableBtnCanGoForward(){
        print("canGoFrwd")
        if webView.canGoForward {
            forwardButton.isEnabled = true
        } else {
            forwardButton.isEnabled = false
        }
    }
    
    private func workIndicator(isAnimated: Bool) {
        if isAnimated {
            self.indicatorLoad.isHidden = false
            self.indicatorLoad.startAnimating()
            self.labelTop.text = "Loading..."
        } else {
            self.indicatorLoad.isHidden = true
            self.indicatorLoad.stopAnimating()
            self.labelTop.text = ""
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        workIndicator(isAnimated: false)
        enableBtnCanGoBack()
        enableBtnCanGoForward()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        workIndicator(isAnimated: true)
    }
    
}























