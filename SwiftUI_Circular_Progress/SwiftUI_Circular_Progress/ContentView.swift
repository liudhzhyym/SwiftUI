//
//  ContentView.swift
//  SwiftUI_Circular_Progress
//
//  Created by bakhaan on 2021/02/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue)
            
            CircularProgress(sliderValue: $sliderValue)
        }
        .padding()
    }
}

struct CircularProgress: View {
    
    @Binding var sliderValue: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: sliderValue)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(sliderValue == 1 ? Color.green : Color.red)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
            
            Text("\(String(format: "%.1f", (sliderValue * 100)))" + " %")
                .bold()
                .font(.largeTitle)
                .foregroundColor(sliderValue == 1 ? .green : .red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
