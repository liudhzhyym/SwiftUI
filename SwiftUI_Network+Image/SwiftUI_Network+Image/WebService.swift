//
//  WebService.swift
//  SwiftUI_Network+Image
//
//  Created by bakhaan on 2021/02/05.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var avatar: String
    var createdAt: String
}

class WebService {
    
    // https://601cb45c1a9c220017060c66.mockapi.io/user
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        
        guard let url = URL(string: "https://601cb45c1a9c220017060c66.mockapi.io/user") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let hasData = data else { return }
            
            do {
                let users = try! JSONDecoder().decode([User].self, from: hasData)
                completion(users)
            } catch {
                print("--->error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

// Image
class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        self.loadImageFromURL()
    }
    
    func loadImageFromURL() {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let hasData = data else { return }
            
            guard let loadedImage = UIImage(data: hasData) else { return }
            
            DispatchQueue.main.async {
                self.image = loadedImage
            }
            
        }.resume()
    }
}

struct URLImage: View {
    
    @ObservedObject var loader: ImageLoader
    
    init(urlString: String) {
        self.loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage(systemName: "photo.on.rectangle")!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
    }
}
