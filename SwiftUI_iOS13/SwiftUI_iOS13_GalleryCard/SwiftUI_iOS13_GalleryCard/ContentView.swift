//
//  ContentView.swift
//  SwiftUI_iOS13_GalleryCard
//
//  Created by bakhaan on 2021/02/12.
//

import SwiftUI


struct GalleryItem: Hashable {
    var color: Color
    var title: String
}

struct ContentView: View {
    
    var items = [
        GalleryItem(color: .red, title: "Title-1"),
        GalleryItem(color: .blue, title: "Title-2"),
        GalleryItem(color: .gray, title: "Title-3"),
        GalleryItem(color: .green, title: "Title-4"),
        GalleryItem(color: .orange, title: "Title-5"),
        GalleryItem(color: .yellow, title: "Title-6"),
        GalleryItem(color: .pink, title: "Title-7")
    ]
    
    var itemsSize = CGSize(width: 100, height: 100)
    var scrollViewSize = CGSize(width: 400, height: 300)
    
    var leadingPadding: CGFloat {
        scrollViewSize.width / 2 - itemsSize.width / 2
    }
    
    var body: some View {
        GeometryReader(content: { scrollGeo in
            
            let scrollMinX = scrollGeo.frame(in: .global).minX
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 50) {
                    
                    ForEach(items, id: \.self) { item in
                        
                        GeometryReader(content: { geometry in
                            
                            let minX = geometry.frame(in: .global).minX
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .frame(width: itemsSize.width, height: itemsSize.height)
                                    .foregroundColor(item.color)

                                VStack {
                                    Spacer()
                                    Text(item.title)
                                        .padding(.bottom, 10)
                                }
                            }
                            .rotation3DEffect(
                                .degrees(Double(minX - leadingPadding - scrollMinX) / 3),
                                axis: (x: 0.0, y: -1.0, z: 0.0)
                            )
                        })
                        .frame(width: itemsSize.width, height: itemsSize.height)
                    }
                }
                .padding(.vertical, 50)
                .padding([.leading, .trailing], leadingPadding)
            }
            .background(Color.black.opacity(0.2))
        })
        .frame(width: scrollViewSize.width, height: scrollViewSize.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
