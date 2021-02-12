//
//  ContentView.swift
//  SwiftUI_iOS13_Button_Style
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Button 1")
            }, label: {
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.largeTitle)
                    Text("Edit")
                        .font(.largeTitle)
                }
            })
            .buttonStyle(MyCustomButton())
            
            Button(action: {
                print("Button 2")
            }, label: {
                Text("Hello, this is Second Btn")
            })
            .buttonStyle(MyCustomButton())
        }
    }
}

struct MyCustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
