//
//  ContentView.swift
//  SwiftUI_Lecture_6_Button
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// Button
// State (Property Wrapper)
// 하나의 view 안에서 사용되는 값

struct ContentView: View {
    
    @State private var didSelected = false
    
    var buttonImage: String {
        if didSelected {
            return "circle"
        } else {
            return "pencil"
        }
    }
    
    var body: some View {
        VStack {
            Button(action: {
                didSelected.toggle()
            }, label: {
                HStack(spacing: 0) {
                    Image(systemName: buttonImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .font(.largeTitle)
                }
            })
            
            Text("Current Status: \(didSelected.description)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
