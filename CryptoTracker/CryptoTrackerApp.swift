//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Rajesh Ghosh on 2023-02-20.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject private var homeVM = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(homeVM)
        }
    }
}
