//
//  ContentView.swift
//  SwiftUI_Lecture_7_Toggle
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// Toggle (Switch)

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
//        Toggle("Toggle1: \(isOn.description)", isOn: $isOn)
        VStack {
            MyToggle(isOn: $isOn)
            Text("---> Origin: \(isOn.description)")
        }
    }
}

struct MyToggle: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Toggle2: \(isOn.description)", isOn: $isOn)
        Toggle(isOn: $isOn, label: {
            VStack {
                Text("Label")
                Text("Label")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
