//
//  WebService.swift
//  SwiftUI_JSON
//
//  Created by bakhaan on 2021/02/05.
//

import Foundation

//"userId": 1,
//"id": 1,
//"title": "delectus aut autem",
//"completed": false

struct Todo: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}

class WebService {
    // https://jsonplaceholder.typicode.com/todos
    
    func getTodos(completion: @escaping ([Todo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let hasData = data else { return }
            
            do {
                let todos = try JSONDecoder().decode([Todo].self, from: hasData)
                completion(todos)
            } catch {
                print("--->\(error.localizedDescription)")
            }
        }.resume()
    }
}
