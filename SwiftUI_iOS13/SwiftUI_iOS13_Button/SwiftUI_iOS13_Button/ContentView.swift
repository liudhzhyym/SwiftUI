//
//  ContentView.swift
//  SwiftUI_iOS13_Button
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSelected = false
    
    var isSelectedState: Color {
        if isSelected {
            return .blue
        } else {
            return .red
        }
    }
    
    var body: some View {
        VStack {
            Text("\(isSelected.description)")
                .padding()
            
            Button(action: {
                isSelected.toggle()
            }, label: {
                HStack(spacing: 0) {
                    Image(systemName: "pencil")
                    Text("Edit Text")
                }
//                .foregroundColor(isSelected ? .blue : .red)
                .foregroundColor(isSelectedState)
                .font(.largeTitle)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
