//
//  BlooApp.swift
//  Bloo
//
//  Created by Raul Salinas on 3/6/24.
//

import SwiftUI

@main
struct BlooApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
