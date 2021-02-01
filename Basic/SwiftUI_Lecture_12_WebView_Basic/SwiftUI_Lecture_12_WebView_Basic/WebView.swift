//
//  WebView.swift
//  SwiftUI_Lecture_12_WebView_Basic
//
//  Created by bakhaan on 2021/02/01.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> some UIView {
        
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

// UIViewController
struct myWebVC: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let webVC = UIStoryboard.init(name: "WebViewController", bundle: nil).instantiateViewController(identifier: "WebViewController") as! WebViewController
        
        let navi = UINavigationController(rootViewController: webVC)
        
        return navi
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
