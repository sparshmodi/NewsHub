//
//  HomeView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var selectedArticle: Article?
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.articles, id: \.self) {
                    NewsItemView(
                        article: $0,
                        selectedArticle: $selectedArticle
                    )
                }
            }
            .padding(.horizontal, 12)
        }
    }
}

//#Preview {
//    ContentView()
//}
