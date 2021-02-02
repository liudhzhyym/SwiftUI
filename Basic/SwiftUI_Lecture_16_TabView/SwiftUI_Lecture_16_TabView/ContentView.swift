//
//  ContentView.swift
//  SwiftUI_Lecture_16_TabView
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// TabView

struct ContentView: View {
    var body: some View {
        
        TabView {
            First()
                .tabItem {
                    Image(systemName: "person")
                    Text("person")
                }
                .edgesIgnoringSafeArea(.top)
            
            Second()
                .tabItem {
                    Image(systemName: "music.note")
                    Text("music")
                }
                .edgesIgnoringSafeArea(.top)
        }
        
    }
}

struct First: View {
    var body: some View {
        ZStack {
            Color.orange
            Text("First View")
        }
    }
}

struct Second: View {
    var body: some View {
        ZStack {
            Color.gray
            Text("Second View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
