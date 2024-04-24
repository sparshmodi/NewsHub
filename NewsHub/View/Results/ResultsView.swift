//
//  ResultsView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI

struct ResultsView<ViewModel: ObservableResultsViewModel>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedArticle: Article?
    
    var body: some View {
        viewModel.requestError == nil ?
        AnyView(
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.articles.filter { $0.source.name != "[Removed]" }, id: \.self) {
                        NewsItemView(
                            article: $0,
                            selectedArticle: $selectedArticle
                        )
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
        ) :
        AnyView(
            VStack {
                Spacer()
                ErrorView()
                Spacer()
            }
        )
    }
    
    private var shouldLoadMoreItems: Bool {
        viewModel.articles.count != 0 && 
        viewModel.totalArticles != nil &&
        viewModel.requestError == nil &&
        viewModel.articles.count != viewModel.totalArticles
    }
}

//#Preview {
//    ResultsView()
//}
