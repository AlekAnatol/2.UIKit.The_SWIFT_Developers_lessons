//
//  ViewController.swift
//  Lesson_18_UIWebView
//
//  Created by Екатерина Алексеева on 28.04.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    
    //let application = UIApplication.shared
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView.delegate = self
        webView.scalesPageToFit = true
        
        if let myURL = URL(string: "https://www.google.com") {
        //if let urlPdf = Bundle.main.url(forResource: "Алексеева Екатерина Анатольевна", withExtension: "pdf") {
        let myRequest = URLRequest(url: myURL)
        webView.loadRequest(myRequest)
        }
        activityIndicator.center = webView.center
        webView.addSubview(activityIndicator)
        //activityIndicator.isHidden = false
        
        
    }

    //MARK: - UIWebViewDelegate
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        switchActivityIndicatorAnimation(isAnimated: true, indicator: activityIndicator)
        goBackItem.isEnabled = false
        goForwardItem.isEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        switchActivityIndicatorAnimation(isAnimated: false, indicator: activityIndicator)
        if webView.canGoBack {
            goBackItem.isEnabled = true
        }
        if webView.canGoForward {
            goForwardItem.isEnabled = true
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("Start load request", request)
        return true
    }
    
    //MARK: - Function switchActivityIndicatorAnimation
    func switchActivityIndicatorAnimation(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        if isAnimated {
            indicator.startAnimating()
            indicator.isHidden = false
        } else {
            indicator.stopAnimating()
            indicator.isHidden = true
        }
    }
    
    //MARK: - Action
    @IBAction func goBackItePressed(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func goForwardItemPressed(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func refreshItemPressed(_ sender: Any) {
        webView.reload()
    }
}

