//
//  ContentView.swift
//  SwiftUI_Lecture_9_ListSection
//
//  Created by bakhaan on 2021/02/01.
//

import SwiftUI

// List Section
// 1. 기본 구조
// 2. data 가공 -> 원하는 형태로 표현

// Model
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let index: Int
}

struct ContentView: View {
    
    var animalList = [
        Animal(name: "dog", index: 3),
        Animal(name: "bird", index: 8),
        Animal(name: "dog", index: 1),
        Animal(name: "cat", index: 4),
        Animal(name: "cat", index: 6),
        Animal(name: "cat", index: 5),
        Animal(name: "cat", index: 7),
        Animal(name: "bird", index: 9),
        Animal(name: "dog", index: 2)
    ]
    
    var animalGrouped: [String: [Animal]] {
        let sortedList = animalList.sorted { $0.index < $1.index }
        return Dictionary(grouping: sortedList) { $0.name }
    }
    
    var groupKey: [String] {
        animalGrouped.map { $0.key }
    }
    
    var body: some View {
//        List {
//            Section(header: Text("header area")) {
//                Text("A")
//                Text("A")
//                Text("A")
//            }
//
//            Section(footer: Text("header area")) {
//                Text("B")
//                Text("B")
//                Text("B")
//            }
//
//            Section(header: Text("header area"), footer: Text("footer area")) {
//                Text("C")
//                Text("C")
//                Text("C")
//            }
//        }
        List {
            ForEach(groupKey, id: \.self) { key in
                Section(header: Text("\(key)")) {
                    ForEach(animalGrouped[key]!) { animal in
                        HStack {
                            Text("\(animal.name)")
                            Text("\(animal.index)")
                        }
                    }
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
