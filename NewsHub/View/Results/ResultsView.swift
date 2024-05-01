//
//  ResultsView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI

struct ResultsView: View {
    @ObservedObject var viewModel: ObservableResultsViewModel
    @State var tappedArticle: Article? = nil
    
    var body: some View {
        if viewModel.isLoading {
            loadingView
        } else if let error = viewModel.requestError {
            errorView(for: error)
        } else if viewModel.articles.filter({ $0.source.name != "[Removed]" }).count == 0 {
            emptyView
        } else {
            scrollableNewsItemsView
        }
    }
    
    private var shouldLoadMoreItems: Bool {
        viewModel.articles.count != 0 && 
        viewModel.totalArticles != nil &&
        viewModel.requestError == nil &&
        viewModel.articles.count != viewModel.totalArticles
    }
    
    var scrollableNewsItemsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.articles.filter { $0.source.name != "[Removed]" }) {
                    NewsItemView(article: $0, tappedArticle: $tappedArticle)
                    Rectangle()
                        .fill(Color(.systemFill))
                        .frame(height: 1)
                        .edgesIgnoringSafeArea(.horizontal)
                }
                
                if shouldLoadMoreItems {
                    ProgressView()
                        .onAppear(perform: viewModel.loadMoreItems)
                }
            }
            .animation(.easeIn, value: viewModel.articles)
        }
        .sheet(item: $tappedArticle) { article in
            SafariView(url: URL(string: article.url)!)
        }
        .sensoryFeedback(.impact(weight: .light), trigger: tappedArticle) { old, _ in
            old == nil
        }
    }
    
    var emptyView: some View {
        VStack {
            Spacer()
            EmptyView()
            Spacer()
        }
    }
    
    func errorView(for error: Error) -> some View {
        VStack {
            Spacer()
            ErrorView(error: error)
            Spacer()
        }
    }
    
    var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

//#Preview {
//    ResultsView()
//}
