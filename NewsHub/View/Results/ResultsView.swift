//
//  ResultsView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI
import Combine

struct ResultsView<ViewModel: ObservableResultsViewModel>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedArticle: Article?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.articles.filter { $0.source.name != "[Removed]" }, id: \.self) {
                    NewsItemView(
                        article: $0,
                        selectedArticle: $selectedArticle
                    )
                }

                if shouldLoadMoreItems {
                    ProgressView()
                        .onAppear(perform: viewModel.loadMoreItems)
                }
            }
            .padding(.horizontal, 12)
            .animation(.easeIn, value: viewModel.articles)
        }
    }
    
    private var shouldLoadMoreItems: Bool {
        viewModel.articles.count != 0 && 
        viewModel.totalArticles != nil &&
        viewModel.articles.count != viewModel.totalArticles
    }
}

//#Preview {
//    ResultsView()
//}
