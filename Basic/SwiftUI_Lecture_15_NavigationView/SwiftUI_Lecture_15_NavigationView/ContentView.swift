//
//  ContentView.swift
//  SwiftUI_Lecture_15_NavigationView
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// NavigationView

struct ContentView: View {
    
    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.red ]
        
        let myAppearance = UINavigationBarAppearance()

        myAppearance.titleTextAttributes = [
            .foregroundColor : UIColor.red,
            .font : UIFont.italicSystemFont(ofSize: 24)
        ]

        myAppearance.largeTitleTextAttributes = [.foregroundColor : UIColor.blue]

        myAppearance.backgroundColor = .orange

        UINavigationBar.appearance().standardAppearance = myAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = myAppearance
        UINavigationBar.appearance().compactAppearance = myAppearance
        
        // 직접 세팅할 때 달라지는 부분
        // safeArea 부분은 적용 안 됨, appearance로 잡힌 영역에만 적용
//        UINavigationBar.appearance().backgroundColor = .orange
        
        // 뒤로가기 부분 색 변경
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        HStack {
                            Image(systemName: "person")
                            Text("Navigate")
                        }
                    })
            }
            
            
            .navigationBarTitle("Hello", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
