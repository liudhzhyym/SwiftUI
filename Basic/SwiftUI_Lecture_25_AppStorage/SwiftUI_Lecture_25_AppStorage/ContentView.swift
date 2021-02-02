//
//  ContentView.swift
//  SwiftUI_Lecture_25_AppStorage
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// AppStorage
// 앱 내에 단순한 값을 저장할 때 사용
// 키워드로 저장

struct ContentView: View {
    
    @AppStorage("Mode") var mode = false
    @AppStorage("notificationCount") var notiCount = ""
    
    var body: some View {
        
        ZStack {
            
            mode ? Color.orange : Color.gray
            
            VStack {
                
                Button("Button") {
                    mode.toggle()
                }
                
                TextField("Noti Count", text: $notiCount)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
