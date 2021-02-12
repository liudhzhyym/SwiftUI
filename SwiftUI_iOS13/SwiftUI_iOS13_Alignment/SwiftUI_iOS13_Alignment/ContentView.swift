//
//  ContentView.swift
//  SwiftUI_iOS13_Alignment
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

// Alignment

struct ContentView: View {
    
    @State private var width: CGFloat = 80
    @State private var height: CGFloat = 80
    
    var body: some View {
        VStack(alignment: .myAlignment) {
            HStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: width, height: height)
                
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: width, height: height)
                    .alignmentGuide(.myAlignment, computeValue: { dimension in
                        dimension[.leading]
                    })
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: width, height: height)
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: width, height: height)
            }

            Rectangle()
                .foregroundColor(.gray)
                .frame(width: width, height: 20)
        }
    }
}

extension HorizontalAlignment {
    
    enum MyAlign: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.leading]
        }
    }
    
    static let myAlignment = HorizontalAlignment(MyAlign.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
