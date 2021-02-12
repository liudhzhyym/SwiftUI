//
//  ContentView.swift
//  SwiftUI_iOS13_Slider
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progressValue: Float = 0
    
    var sliderRange: ClosedRange<Float> {
        return 0...100
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "minus")
                    .onTapGesture {
                        progressValue -= 1
                    }
                
                Slider(value: $progressValue, in: sliderRange)
                    .accentColor(.green)
                
                Image(systemName: "plus")
                    .onTapGesture {
                        progressValue += 1
                    }
            }
            .padding()
            
            Text("\(Int(progressValue))")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
