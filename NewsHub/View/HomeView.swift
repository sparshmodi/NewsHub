//
//  HomeView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var isSearchActive = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                SearchBarView(viewModel: viewModel.searchChildViewModel, isSearchActive: $isSearchActive)
                HeadlinesView(viewModel: viewModel.headlinesChildViewModel)
            }
            .navigationDestination(isPresented: $isSearchActive) {
                SearchView(viewModel: viewModel.searchChildViewModel, isSearchActive: $isSearchActive)
            }
            
        }
    }
}

//#Preview {
//    ContentView()
//}
