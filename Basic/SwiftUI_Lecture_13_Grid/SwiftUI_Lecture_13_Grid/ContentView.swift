//
//  ContentView.swift
//  SwiftUI_Lecture_13_Grid
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// Grid
// CollectionView와 비슷
// 바둑판
// LazyVGrid
// LazyHGrid

struct ContentView: View {
    
    var columns: [GridItem] {
        [GridItem(.fixed(100)),
//         GridItem(.adaptive(minimum: 30, maximum: 100)) --> minimum 기준
//         GridItem(.flexible(minimum: 50, maximum: 200)) --> maximum 기준
//         GridItem(.fixed(50))
        ]
        
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns, content: {
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
