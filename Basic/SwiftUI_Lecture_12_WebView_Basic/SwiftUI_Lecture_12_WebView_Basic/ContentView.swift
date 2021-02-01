//
//  ContentView.swift
//  SwiftUI_Lecture_12_WebView_Basic
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// WebView
// UIKit

// 바로 사용할 수 있는 WebView는 없다
// UIKit에 있는 것을 그대로 가져다 쓰는 방법이 필요하다.

struct ContentView: View {
    
    var body: some View {
        
//        WebView(url: "https://apple.com")
        myWebVC()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
