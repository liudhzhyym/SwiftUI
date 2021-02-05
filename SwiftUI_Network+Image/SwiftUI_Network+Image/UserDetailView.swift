//
//  UserDetailView.swift
//  SwiftUI_Network+Image
//
//  Created by bakhaan on 2021/02/05.
//

import Foundation
import SwiftUI


struct UserDetailView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            URLImage(urlString: user.avatar)
            Text(user.name)
                .font(.largeTitle)
                .bold()
            Text(user.createdAt)
        }
    }
}
