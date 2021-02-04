//
//  ContentView.swift
//  SwiftUI_GridViewGallery
//
//  Created by bakhaan on 2021/02/04.
//

import SwiftUI

// CaseIterable -> case를 배열화 시킨다
enum GridType: CaseIterable {
    case single
    case double
    case triple
    case adaptive
    
    var columns: [GridItem] {
        switch self {
        case .single:
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())]
        case .adaptive:
            return [GridItem(.adaptive(minimum: 60))]
        }
    }
}

struct ContentView: View {
    
    @State private var selectedGridType: GridType = .single
    
    var items = Item.dummyData
    
    var body: some View {
        
        VStack {
            GridTypePicker(selectedGridType: $selectedGridType)

            ScrollView {
                LazyVGrid(columns: selectedGridType.columns, content: {
                    ForEach(items) { item in
                        
                        switch selectedGridType {
                        case .single:
                            SingleRow(item: item)
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                })
                .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
