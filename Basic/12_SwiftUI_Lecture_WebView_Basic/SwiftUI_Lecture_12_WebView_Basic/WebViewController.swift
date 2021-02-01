//
//  WebViewController.swift
//  SwiftUI_Lecture_12_WebView_Basic
//
//  Created by bakhaan on 2021/02/01.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: url)!))
    }
    
    // webView 로딩이 완료됐을 때 사용되는 로직
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 일반적으로 webView를 가져올 때 타이틀을 가져온다
        // get webView Title
        self.webView.evaluateJavaScript("document.title") { (result, error) in
            self.navigationItem.title = result as? String
        }
    }
    
}
