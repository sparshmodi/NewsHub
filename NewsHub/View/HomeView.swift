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
    @State var shouldShowSearchResults = false
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
                    .padding(.top, 8)
                    .padding(.horizontal, 12)
                    
                    SearchBarView(viewModel: viewModel.searchChildViewModel, shouldShowSearchResults: $shouldShowSearchResults)
                        .padding(.horizontal, 12)
                    HeadlinesView(viewModel: viewModel.headlinesChildViewModel)
                }
                .navigationDestination(isPresented: $shouldShowSearchResults) {
                    SearchView(viewModel: viewModel.searchChildViewModel, shouldShowSearchResults: $shouldShowSearchResults)
                        .navigationTitle("Search")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .navigationDestination(isPresented: $shouldShowSettings) {
                    SettingsView()
                        .navigationTitle("Settings")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .blur(radius: overlayViewModel.longPressedArticle != nil ? 15 : 0)
            .sensoryFeedback(.impact(weight: .heavy), trigger: overlayViewModel.longPressedArticle) { old, _ in
                old == nil                
            }
                        
            if let article = overlayViewModel.longPressedArticle {
                ZStack {
                    Color.black.opacity(0.0001)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            overlayViewModel.longPressedArticle = nil
                        }
                    NewsOverlayView(article: article)
                        .padding(20)
                        .animation(.easeIn, value: overlayViewModel.longPressedArticle)
                }
            }
        }
        .preferredColorScheme(appearance.colorScheme)
    }
}
