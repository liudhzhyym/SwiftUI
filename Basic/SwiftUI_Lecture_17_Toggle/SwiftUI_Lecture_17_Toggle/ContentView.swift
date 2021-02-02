//
//  ContentView.swift
//  SwiftUI_Lecture_17_Toggle
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// Toggle
// 기본적으로 제공되는 Toggle은 사이즈 등 변경이 안 된다
// Custom Toggle 필요

// 기본 토글 기능은 사용하면서 스타일만 변경
struct CustomToggle: ToggleStyle {
    // protocol
    func makeBody(configuration: Configuration) -> some View {
        // Design
        RoundedRectangle(cornerRadius: 100)
            .foregroundColor(configuration.isOn ? .blue : .gray)
            .overlay(
                GeometryReader(content: { geometry in
                    let on = geometry.frame(in: .local).minX
                    let off = geometry.frame(in: .local).maxX - geometry.size.height
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.height)
                        Text(configuration.isOn ? "On" : "Off")
                    }
                    .offset(x: configuration.isOn ? on : off)
                    .animation(.easeInOut(duration: 0.25))
                    .shadow(radius: 10)
                    
                })
            )
            .clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                configuration.isOn.toggle()
            })
    }
}

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        
        // 기본 토글
//        Toggle(isOn: $isOn, label: {
//            Text("\(isOn.description)")
//        })
        
        // Custom
        Toggle("\(isOn.description)", isOn: $isOn)
            .toggleStyle(CustomToggle())
            .frame(width: 100, height: 50)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
