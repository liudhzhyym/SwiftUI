//
//  ContentView.swift
//  SwiftUI_Lecture_4_SFSymbols
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "wifi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .foregroundColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
