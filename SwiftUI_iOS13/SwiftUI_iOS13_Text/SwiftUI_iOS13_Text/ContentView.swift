//
//  ContentView.swift
//  SwiftUI_iOS13_Text
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Hello, World!")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .background(Color.red)
                    .padding(20)
                    .background(Color.yellow)
                    .padding(20)
                    .background(Color.orange)
                
                Text("WoW")
                    .padding(20)
                    .background(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
