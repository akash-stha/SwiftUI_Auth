//
//  SwiftUI_Authentication_AppApp.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

@main
struct SwiftUI_Authentication_App: App {
    
    @State private var isPresented: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            SignInView()
                .preferredColorScheme(.dark)
        }
    }
}
