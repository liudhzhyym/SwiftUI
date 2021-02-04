//
//  SingleRow.swift
//  SwiftUI_GridViewGallery
//
//  Created by bakhaan on 2021/02/04.
//

import Foundation
import SwiftUI


struct SingleRow: View {

    let item: Item
    
    var body: some View {
        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.mainTitle)
                            .font(.title)
                            .lineLimit(1)
                        Text(item.subTitle)
                            .font(.title2)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(8)
                .background(Color.white.opacity(0.3))
            }
        }
    }
}

struct SingleRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleRow(item: Item(mainTitle: "main", subTitle: "sub", imageName: "freeBG1"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/))
            
    }
}
