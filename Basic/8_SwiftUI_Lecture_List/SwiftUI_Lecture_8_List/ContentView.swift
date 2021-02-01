//
//  ContentView.swift
//  SwiftUI_Lecture_8_List
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// List
// Model
// for

// Model
struct LocationInfo: Hashable, Identifiable {
    var id = UUID()
    var city: String
    var weather: String
}

struct ContentView: View {
    
    @State private var locations = [
        LocationInfo(city: "Seoul", weather: "sunny"),
        LocationInfo(city: "Busan", weather: "cloudy"),
        LocationInfo(city: "LA", weather: "rainny")
    ]
    
    var body: some View {
        List {
//            ForEach(locations, id: \.self) { location in
//                HStack {
//                    Text("\(location.city), \(location.weather)")
//                }
//            }
            
//            ForEach(locations) { location in
//                HStack {
//                    Text("\(location.city), \(location.weather)")
//                }
//            }
            
            ForEach(0..<locations.count) { index in
                HStack {
                    Text("\(locations[index].city), \(locations[index].weather)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
