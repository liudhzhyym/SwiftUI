//
//  ContentView.swift
//  SwiftUI_iOS13_Image
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            Color.clear
//                .edgesIgnoringSafeArea(.all)
//            Text("Forca Barca!!")
//                .bold()
//                .font(.largeTitle)
//                .foregroundColor(.white)
//        }
//        .background(
////            Image("1")
////                .resizable()
////                .aspectRatio(contentMode: .fill)
////                .edgesIgnoringSafeArea(.all)
//            Image("1")
//                .resizable(capInsets: .init(top: 100, leading: 0, bottom: 0, trailing: 100), resizingMode: .tile)
//        )
        
        Text("Helloeoeo\nkdkdlasdkfaslaa\nasdassasasaasa")
            .bold()
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(20)
            .background(Color.green)
            .cornerRadius(16)
            .frame(width: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
