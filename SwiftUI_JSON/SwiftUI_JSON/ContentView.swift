//
//  ContentView.swift
//  SwiftUI_JSON
//
//  Created by bakhaan on 2021/02/05.
//

import SwiftUI

// JSON

struct ContentView: View {
    
    @State private var todos =  [Todo]()
    
    var body: some View {
        List(todos) { todo in
            VStack(alignment: .leading) {
                Text(todo.title!)
                Text(todo.completed!.description)
                    .foregroundColor(
                        todo.completed == true ? .red : .blue
                    )
            }
        }
        .onAppear {
            WebService().getTodos { todos in
                self.todos = todos
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
