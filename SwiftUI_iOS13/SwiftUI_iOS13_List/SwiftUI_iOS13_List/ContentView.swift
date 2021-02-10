//
//  ContentView.swift
//  SwiftUI_iOS13_List
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct LocationInfo: Identifiable {
    let id = UUID()
    var city = ""
    var weather = ""
    
    var cityPresenter: some View {
        Text(city)
    }
    
    func cityPresenterWidthIndex(_ index: Int) -> some View {
        Text("\(index) " + city)
    }
}

struct ContentView: View {
    
    var locs = [
        LocationInfo(city: "Seoul", weather: "Sunny"),
        LocationInfo(city: "Busan", weather: "Rainny"),
        LocationInfo(city: "UIjeongbu", weather: "Cloudy"),
    ]
    
    
    var body: some View {
        List {
            ForEach(locs) { location in
//                Text("city: \(location.city), WD: \(location.weather)")
                location.cityPresenter
            }
            
            ForEach(0..<locs.count) { index in
//                Text("\(index) -> " + "\(locs[index].city)")
                locs[index].cityPresenterWidthIndex(index)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
