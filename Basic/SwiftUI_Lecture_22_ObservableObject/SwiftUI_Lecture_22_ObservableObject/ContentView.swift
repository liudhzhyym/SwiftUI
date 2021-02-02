//
//  ContentView.swift
//  SwiftUI_Lecture_22_ObservableObject
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// ObservableObject
// class 기반 복잡한 구조, 여기 저기에서 사용하는 Model을 만든다고 했을 때 이 개념을 사용

class MyInfo: ObservableObject {
    @Published var myAge = 20
//    @Published var myName = "Kim"
    var myName = "Kim" {
        didSet {
            if oldValue.count == 0 {
                objectWillChange.send() // publish 없이 조건으로 값 변경
            }
        }
    }
    // Observed될 필요가 없으면 @Published를 붙이지 않아도 된다
    // @Published 되어있지 않으면 값 변경 불가능
}

struct ContentView: View {
    
    @ObservedObject var myInfo = MyInfo()
    
    var body: some View {
        VStack {
            Text(myInfo.myName)
                .padding()

            Button("Change Name!") {
                myInfo.myName = "Lee"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
