//
//  ContentView.swift
//  SwiftUI_Lecture_24_StateObject
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// StateObject

class MyInfo: ObservableObject {
    @Published var myScore = 0
}

struct ContentView: View {
    
    // view를 유지해야 하는 상태 / view를 계속 갱신해야 하는 상태의 차이가 있다
    @ObservedObject var myInfo = MyInfo()
    
//    @StateObject var myInfo2 = MyInfo()
    
    var body: some View {
        VStack {
            Text("\(myInfo.myScore)")
                .font(.largeTitle)
            
            Button("Plus1") {
                myInfo.myScore += 1
            }
            
            CustomButton()
//
//            Text("\(myInfo2.myScore)")
//                .font(.largeTitle)
//
//            Button("Plus2") {
//                myInfo2.myScore += 1
//            }
        }
    }
}

struct CustomButton: View {
    
    // ---> 메인 View가 갱신되면 이 데이터도 갱신, 갱신이 필요할 때 사용
//    @ObservedObject var myInfo2 = MyInfo()
      
    // ---> 갱신X, 유지하려면 stateobject 사용
    @StateObject var myInfo2 = MyInfo()
    
    // 같은 값을 사용할 때(ex)값을 받아오는 경우)는 어떤 걸 써도 받아 온 값으로 표시됨, 갱신X
    
    var body: some View {
        VStack {
            Text("\(myInfo2.myScore)")
                .font(.largeTitle)
            
            Button("Plus2") {
                myInfo2.myScore += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
