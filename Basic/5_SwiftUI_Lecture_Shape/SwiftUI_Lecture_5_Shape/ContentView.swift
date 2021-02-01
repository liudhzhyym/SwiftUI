//
//  ContentView.swift
//  SwiftUI_Lecture_5_Shape
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
//                .fill(Color.red)
//                .frame(width: 100, height: 100)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .miter, miterLimit: 1,dash: [20, 20], dashPhase: 10))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
//                .frame(width: 100, height: 100)
            
            Circle()
                .fill(Color.red)
//                .frame(width: 100, height: 50)
            
            Capsule()
                .fill(Color.red)
//                .frame(width: 100, height: 50)
            
            Ellipse()
                .fill(Color.red)
//                .frame(width: 100, height: 50)
        }
        .frame(width: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
