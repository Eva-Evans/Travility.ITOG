//
//  TravilityApp.swift
//  Travility
//
//  Created by Сергей Зауэрс on 25.02.2025.
//

import SwiftUI
import FirebaseCore

@main
struct TravilityApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
