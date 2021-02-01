//
//  ContentView.swift
//  SwiftUI_Lecture_10_ViewModifier
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// ViewModifier
// 반복되는 코드를 Modify

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Main Title")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
            Text("Sub Title")
                .modifier(MyTextStyle())
            Text("Decsription")
                .modifier(MyTextStyle(myColor: .red))
            Text("Decsription")
                .customFonts(color: .orange)
        }
    }
}

struct MyTextStyle: ViewModifier {
    
    var myWeight = Font.Weight.regular
    var myFont = Font.title2
    var myColor = Color.black
    
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            .padding(.bottom, 20)
    }
}

// 기능 확장으로 .italic() 추가하기
extension Text {
    func customFonts(color: Color) -> Text {
        self
            .font(.title2)
            .bold()
            .italic()
            .foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
