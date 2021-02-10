//
//  ContentView.swift
//  SwiftUI_iOS13_Image_2
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("1")
            .resizable()
            .mask(
                ZStack {
                    Circle()
                        .offset(x: 0, y: -100)
                    
                    Circle()
                        .frame(width: 100, height: 100)
                        .offset(x: 80, y: 80)
                    
                    Circle()
                        .frame(width: 60, height: 60)
                        .offset(x: 120, y: 160)
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
