//
//  ContentView.swift
//  SwiftUI_Lecture_11_AlertView
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// Alert View
// 경고창 만들기

struct ContentView: View {
    
    @State private var isShowAlert = false
    
    @State private var selectedText = ""
    
    var body: some View {
        VStack {
            Spacer()
            Button("Show Alert") {
                isShowAlert.toggle()
            }
            .alert(isPresented: $isShowAlert, content: {
//                Alert(title: Text("Alert Title!"), dismissButton: .cancel())
                let primaryButton = Alert.Button.default(Text("Done")) {
                    selectedText = "Done!"
                }
                let secondaryButton = Alert.Button.default(Text("Cancel")) {
                    selectedText = "Cancle!"
                }
                return Alert(title: Text("Alert~!"), message: Text("Hello"),primaryButton: primaryButton, secondaryButton: secondaryButton)
            })
            
            Spacer()
            Text("\(isShowAlert.description)")
            Spacer()
            Text("\(selectedText)")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
