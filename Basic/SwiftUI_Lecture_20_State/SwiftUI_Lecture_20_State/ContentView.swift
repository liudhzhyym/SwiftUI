//
//  ContentView.swift
//  SwiftUI_Lecture_20_State
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// State

struct ContentView: View {
    
    @State private var myName = "Kim"
    
    var body: some View {
        
        VStack {
            Text("\(myName)")
                .padding()
            
            Button("Change Name!") {
                myName = "Lee"
            }
            
            TextField("TF Title", text: $myName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
