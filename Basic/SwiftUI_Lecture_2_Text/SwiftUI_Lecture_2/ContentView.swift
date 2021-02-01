//
//  ContentView.swift
//  SwiftUI_Lecture_2
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!")
                .font(.largeTitle)
                .underline()
                .bold()
                .foregroundColor(.blue)
//                .lineLimit(1)
                .truncationMode(.tail)
                .lineSpacing(20)
//                .frame(width: 100)
//                .padding()
//                .background(Color.green)
//                .cornerRadius(10)
            
            Text("Hello, world!")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
