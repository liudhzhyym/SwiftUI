//
//  ContentView.swift
//  SwiftUI_Circle_Progress
//
//  Created by bakhaan on 2021/02/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
            
            CircularProgressBar(progress: $progress)
        }
        .padding(20)
    }
}

struct CircularProgressBar: View {
    
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(progress == 1 ? Color.green : Color.red)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
            
            Text("\(String(format: "%.2f",(progress * 100))) %")
                .font(.largeTitle)
                .bold()
                .foregroundColor(progress == 1 ? .green : .red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
