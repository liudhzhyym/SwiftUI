//
//  ContentView.swift
//  SwiftUI_iOS13_GeometryReader
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

// GeometryReader
// container View

struct ContentView: View {
    var body: some View {
        
        HStack(spacing: 0) {
            
            Text("Hello, World!")
                .frame(width: 100)
            
            GeometryReader(content: { geometry in
                VStack {
                    Text("Hello, World!")
                        .frame(width: geometry.size.width)
                    Text("\(geometry.size.width)")
                    Text("\(geometry.frame(in: .global).minX)")
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
