//
//  ContentView.swift
//  SwiftUI_Network+Image
//
//  Created by bakhaan on 2021/02/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], content: {
                    ForEach(users) { user in
                        
                        NavigationLink(
                            destination: UserDetailView(user: user),
                            label: {
                                HStack {
                                    URLImage(urlString: user.avatar)
                                    Text("\(user.name)")
                                    Spacer()
                                }
                            })
                    }
                })
            }
            .navigationBarTitle("User List", displayMode: .large)
        }
        
        .onAppear {
            WebService().loadUsers { users in
                self.users = users
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
