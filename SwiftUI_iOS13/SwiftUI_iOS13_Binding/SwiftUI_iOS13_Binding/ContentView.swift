//
//  ContentView.swift
//  SwiftUI_iOS13_Binding
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

// @Binding

struct ContentView: View {
    
    @State private var str = "Hello"
    
    @State private var isToggle = false
    
    var body: some View {
        
        VStack {
            
            TextField("placeholder TextField", text: $str)
                .padding(20)
                .background(Color.black.opacity(0.2))
                .font(.largeTitle)
                .padding(20)
            
            Text(str)
                .font(.largeTitle)
            
            MyButton(str: $str)
        }
    }
}

struct MyButton: View {
    
    @Binding var str: String
    
    var body: some View {
        Button(action: {
            str = "Hi"
        }, label: {
            Text("Click Me!")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
