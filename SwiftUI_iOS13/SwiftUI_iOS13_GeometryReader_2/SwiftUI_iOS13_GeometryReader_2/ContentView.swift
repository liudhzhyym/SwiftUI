//
//  ContentView.swift
//  SwiftUI_iOS13_GeometryReader_2
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height: geometry.size.height / 3)
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
            }
        })
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
