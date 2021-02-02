//
//  ContentView.swift
//  SwiftUI_Lecture_21_Binding
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// Binding
// 새로운 View에서 State를 사용하고 싶을 때 @Binding 을 사용

struct ContentView: View {
    
    @State private var myBool = false
    
    var body: some View {
        
        NavigationView(content: {
            
            VStack {
                
                NavigationLink(destination: DetailView(mainToggleValue: $myBool)) { Text("Navigate") }
                Toggle("Main: \(myBool.description)", isOn: $myBool)
            }
        })
    
    }
}

struct DetailView: View {
    
    @Binding var mainToggleValue: Bool
    
    var body: some View {
        Toggle("Detail Toggle", isOn: $mainToggleValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
