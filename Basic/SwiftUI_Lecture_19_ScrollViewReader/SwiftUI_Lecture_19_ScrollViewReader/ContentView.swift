//
//  ContentView.swift
//  SwiftUI_Lecture_19_ScrollViewReader
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

// ScrollViewReader
// 스크롤 시 특정한 위치로 이동하기 위해 사용

struct ContentView: View {
    
    @State private var proxy: ScrollViewProxy?
    
    var body: some View {
        
        VStack {
            
            Button("Scroll To") {
                withAnimation(.easeInOut) {
                    proxy?.scrollTo(20, anchor: .top) // 숫자는 인덱스
                }
            }
            
            ScrollView {
                
                ScrollViewReader(content: { proxy in
                    
                    ForEach(0..<50) { index in
                        Text("\(index)")
                            .padding()
                    }
                    .onAppear(perform: { // 데이터 세팅 후 한 번만 호출
                        self.proxy = proxy
                    })
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
