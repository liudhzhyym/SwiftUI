//
//  ContentView.swift
//  SwiftUI_iOS13_ObservableObject+ObservedObject
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

// ObservableObject - 감시, 관찰 가능한 객체
// ObservedObject - 감시, 관찰된 객체
// 관찰: 변경, 삭제, 추가 등 상태 변경을 계속 확인하는 것
// class에서 가능

class MyProfile: ObservableObject {
    @Published var name = "Leo"
    @Published var age = 20
    
    func changeProfile() {
        name = "Messi"
        age = 30
    }
}

struct ContentView: View {
    
    @ObservedObject var profile = MyProfile()
    
    var body: some View {
        VStack {
            Text("Name: \(profile.name)")
            Text("Age: \(profile.age)")
            
            Button(action: {
                profile.changeProfile()
            }, label: {
                Text("Click Me!")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
