//
//  Item.swift
//  SwiftUI_GridViewGallery
//
//  Created by bakhaan on 2021/02/04.
//

import Foundation


//Model
struct Item: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummyData: [Item] {
        
//        var temp: [Item]
//
//        for index in 0...30 {
//            temp.append(
//                Item(mainTitle: "Main Title index\(index)",
//                     subTitle: "Sub Title index\(index)",
//                     imageName: "freeBG\(index % 3 + 1)")
//            )
//        }
//
//        return temp
        
        (0...30).map {
            Item(mainTitle: "Main Title index\($0)",
                 subTitle: "Sub Title index\($0)",
                 imageName: "freeBG\($0 % 3 + 1)")
        }
    }
}
