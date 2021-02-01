//
//  WebView.swift
//  Swift_Lecture_0_WebView_JS_Bridge
//
//  Created by bakhaan on 2021/02/01.
//

import UIKit
import WebKit
import SwiftUI

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
