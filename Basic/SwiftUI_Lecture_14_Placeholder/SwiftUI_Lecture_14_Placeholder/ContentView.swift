//
//  ContentView.swift
//  SwiftUI_Lecture_14_Placeholder
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// Placeholder
// redact

struct ContentView: View {
    
    @State private var myString = "Hello, World!"
    
    @State private var showPlaceholder = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                Text(myString)
                    .foregroundColor(Color.red)
                    .padding()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())
            
            Button("Click me") {
                showPlaceholder.toggle()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
