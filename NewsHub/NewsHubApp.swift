//
//  NewsHubApp.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import SwiftUI

@main
struct NewsHubApp: App {
    @StateObject var homeViewModel: HomeViewModel
    
    init() {
        _homeViewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homeViewModel)
        }
    }
}
