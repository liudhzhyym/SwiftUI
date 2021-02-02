//
//  ContentView.swift
//  SwiftUI_Lecture_18_TextEditer
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// TextEditer
// UIKit -> TextView

struct ContentView: View {
    
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $inputText)
                .padding() // ---> TextEditor는 패딩을 줘야 safeArea를 벗어난다
                .lineSpacing(20)
                .font(.title)
                .disableAutocorrection(true) // ---> 자동완성해제
                .onChange(of: inputText, perform: { value in
                    if inputText.count > 50 {
                        inputText.removeLast()
                    }
                })
                
            HStack {
                Spacer()
                Text("\(inputText.count) / 50")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
