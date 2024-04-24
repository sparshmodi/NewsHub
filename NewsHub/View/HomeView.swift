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
            VStack(spacing: 10) {
                AppLogoView()
                SearchBarView(viewModel: viewModel.searchChildViewModel, isSearchActive: $isSearchActive)
                    .padding(.horizontal, 12)
                HeadlinesView(viewModel: viewModel.headlinesChildViewModel)
            }
            .navigationDestination(isPresented: $isSearchActive) {
                VStack(spacing: 10) {
                    AppLogoView()
                    SearchView(viewModel: viewModel.searchChildViewModel, isSearchActive: $isSearchActive)
                }
            }
            .background(Color(.systemBackground))
        }
        .environment(\.colorScheme, .dark)
    }
}

//#Preview {
//    ContentView()
//}
