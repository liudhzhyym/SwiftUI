//
//  ContentView.swift
//  SwiftUI_Lecture_1
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.red
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
            VStack {
                HStack {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }.padding(.bottom, 50)
                Text("Hello, world!")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
