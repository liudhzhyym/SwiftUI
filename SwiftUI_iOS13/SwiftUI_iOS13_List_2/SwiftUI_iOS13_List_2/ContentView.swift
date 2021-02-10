//
//  ContentView.swift
//  SwiftUI_iOS13_List_2
//
//  Created by bakhaan on 2021/02/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = ["Kim", "Lee", "Park", "Choi"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("List Header")) {
                    ForEach(users, id: \.self) { name in
                        Text(name)
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }

            .navigationBarItems(leading: EditButton())
            .navigationBarTitle("Navi Title", displayMode: .large)
//            .navigationBarItems(trailing:
//                Button(action: {
//                    self.users.append("New Name")
//                }, label: {
//                    Image(systemName: "plus")
//                })
//            )
        }
    }
    
    func deleteItem(idx: IndexSet) {
        guard let index = idx.first else { return }
        self.users.remove(at: index)
    }
    
    func moveItem(idx: IndexSet, int: Int) {
        users.move(fromOffsets: idx, toOffset: int)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
