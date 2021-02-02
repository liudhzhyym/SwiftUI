//
//  ContentView.swift
//  SwiftUI_Lecture_23_EnvironmentObject
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// EnvironmentObject
// 앱의 여러 화면에서 사용하는 데이터인 싱글톤과 비슷한 방식
// swiftui 에서는 싱글톤으로 만들면 애매해지는 상황이 생김

class MyInfo: ObservableObject {
    @Published var name = ""
    @Published var photoURL = ""
    var token = "" // ---> 화면 표시X, 화면 갱신X, Publised X
}

class MyLoc: ObservableObject {
    @Published var geo = "Seoul"
}

struct ContentView: View {
    
    // ObservedObject -> 화면이 넘어갈 때마다 계속 그 데이터를 가지고 있다
    // EnvironmentObject -> 필요한 화면에서만 데이터 사용 가능
    // EnvironmentObject는 타입으로만 지정할 수 있다
    @EnvironmentObject var myInfo: MyInfo
    @EnvironmentObject var myLoc: MyLoc
    
    var body: some View {
        
        NavigationView(content: {
            VStack {
                NavigationLink(destination: Detail()) {
                    Text("Navigate")
                }
                
                Text("name: \(myInfo.name)")
                    .font(.largeTitle)
                    .padding()
                
                Text("photoURL: \(myInfo.photoURL)")
                    .font(.largeTitle)
                    .padding()
                
                Text("location: \(myLoc.geo)")
                    .font(.largeTitle)
                    .padding()
            }
            
        })
        .onAppear(perform: {
            myInfo.name = "Kim"
            myInfo.photoURL = "https://google.com"
        })
        
    }
}

struct Detail: View {
    
    @EnvironmentObject var myInfo: MyInfo
    
    var body: some View {
        VStack {
            Text("Detail name: \(myInfo.name)")
                .font(.largeTitle)
                .padding()
            
            Text("Detail photoURL: \(myInfo.photoURL)")
                .font(.largeTitle)
                .padding()
            
            Button("Change Name") {
                myInfo.name = "Leeee"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MyInfo())
            .environmentObject(MyLoc())
    }
}
