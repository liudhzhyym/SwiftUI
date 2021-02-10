//
//  ContentView.swift
//  SwiftUI_iOS13_Text_2
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // 텍스트 타입과 관련된 타입 먼저 사용해야 한다 (이미지, 버튼 등도 마찬가지)
        /*
         // ---> error
         Text("Hello, world!")
            .background(Color.yellow)
            .underline()
         */
        Text("Hello, world!")
            .italic()
            .underline()
            // frame 안쪽으로 padding을 주고 싶다면 frame 이전에 작성
//            .padding([.trailing, .top], 20)
//            .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 40))
            .padding(20)
            .frame(width: 300, height: 50, alignment: .center)
            .background(Color.blue)
            .cornerRadius(25) // ---> 아무리 값을 많이 줘도 정해진 최대치만큼만 적용된다
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 35)
                    .stroke(Color.blue, lineWidth: 5)
            )
//            .border(Color.red, width: 5)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
