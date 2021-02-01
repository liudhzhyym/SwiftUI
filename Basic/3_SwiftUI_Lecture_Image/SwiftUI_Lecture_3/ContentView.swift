//
//  ContentView.swift
//  SwiftUI_Lecture_3
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Hello")
                .background(Color.green)
            Text("Hello")
                .background(Color.green)
            
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 20)
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .mask(
//                    Circle()
//                    VStack(spacing: 0) {
//                        Circle()
//                        Circle()
//                    }
                    HStack(spacing: 0) {
                        Circle()
                        Circle()
                    }
                )
                .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
