//
//  SwiftUI_Lecture_23_EnvironmentObjectApp.swift
//  SwiftUI_Lecture_23_EnvironmentObject
//
//  Created by bakhaan on 2021/02/02.
//

import SwiftUI

@main
struct SwiftUI_Lecture_23_EnvironmentObjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MyInfo())
                .environmentObject(MyLoc())
        }
    }
}
