//
//  HomeView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("appearance") private var appearance: Appearance = .system
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var overlayViewModel: OverlayViewModel
    @State var isSearchActive = false
    @State var shouldShowSettings = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 10) {
                    HStack {
                        AppLogoView()
                        Spacer()
                        SettingsIconView(shouldShowSettings: $shouldShowSettings)
                    }
                    .padding(.top, 4)
                    .padding(.horizontal, 12)
                    
                    SearchBarView(viewModel: viewModel.searchChildViewModel, isSearchActive: $isSearchActive)
                        .padding(.horizontal, 12)
                    HeadlinesView(viewModel: viewModel.headlinesChildViewModel)
                }
                .navigationDestination(isPresented: $isSearchActive) {
                    SearchView(viewModel: viewModel.searchChildViewModel, isSearchActive: $isSearchActive)
                        .navigationTitle("Search")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .navigationDestination(isPresented: $shouldShowSettings) {
                    SettingsView()
                        .navigationTitle("Settings")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .preferredColorScheme(appearance.colorScheme)
            .blur(radius: overlayViewModel.selectedArticle != nil ? 15 : 0)
            
            Group {
                if let article = overlayViewModel.selectedArticle {
                    ZStack {
                        Color.black.opacity(0.0001)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                overlayViewModel.selectedArticle = nil
                            }
                        NewsOverlayView(article: article)
                            .padding(20)
                            .animation(.easeIn, value: overlayViewModel.selectedArticle)
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
